import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failure.dart';
import '../models/recipe_model.dart';

abstract class RecipeDataSource {
  Future<List<RecipeModel>> getAllRecipes();
  Future<List<RecipeModel>> getTrendingRecipes();
  Future<List<RecipeModel>> getRecommendedRecipes();
  Future<void> toggleFavorite(String recipeId, bool isFavorite);
  Stream<List<RecipeModel>> getFavoriteRecipes();
  Future<RecipeModel?> getRecipeById(String recipeId);
  Future<List<RecipeModel>> getUserRecipes();
  Future<void> addRecipeToUser(RecipeModel recipe);
}

class RecipeDataSourceImpl implements RecipeDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  RecipeDataSourceImpl({required this.firestore, required this.auth});

  // Get currently authenticated user ID
  String? get _currentUserId => auth.currentUser?.uid;

  // Get recipe by ID from any collection
  @override
  Future<RecipeModel?> getRecipeById(String recipeId) async {
    try {
      final userId = _currentUserId;
      if (userId == null) return null;

      // Try to find in user's collection first
      DocumentSnapshot? recipeDoc;
      try {
        recipeDoc =
            await firestore
                .collection('users')
                .doc(userId)
                .collection('recipes')
                .doc(recipeId)
                .get();
      } catch (e) {
        throw Failure(e.toString());
      }

      // If not found in user's collection, try public recipes
      if (!recipeDoc.exists) {
        recipeDoc = await firestore.collection('recipes').doc(recipeId).get();
      }

      if (recipeDoc.exists) {
        // Check if is favorite
        final favoriteDoc =
            await firestore
                .collection('users')
                .doc(userId)
                .collection('favorites')
                .doc(recipeId)
                .get();

        final data = recipeDoc.data() as Map<String, dynamic>;
        // Mark as favorite if it exists in favorites collection
        if (favoriteDoc.exists) {
          data['isFavorite'] = true;
        }

        return RecipeModel.fromJson(data, recipeDoc.id);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<RecipeModel>> getAllRecipes() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return [];
      }

      // Get user's recipes
      final userRecipesSnapshot =
          await firestore
              .collection('users')
              .doc(userId)
              .collection('recipes')
              .get();

      // Get user favorites to mark recipes as favorite
      final userFavoritesSnapshot =
          await firestore
              .collection('users')
              .doc(userId)
              .collection('favorites')
              .get();

      Map<String, bool> userFavorites = {};
      for (var doc in userFavoritesSnapshot.docs) {
        userFavorites[doc.id] = true;
      }

      // Process the recipes with favorite status
      List<RecipeModel> recipes = [];
      for (var doc in userRecipesSnapshot.docs) {
        try {
          Map<String, dynamic> data = doc.data();
          // Override isFavorite with user's actual favorites
          data['isFavorite'] = userFavorites.containsKey(doc.id);
          recipes.add(RecipeModel.fromJson(data, doc.id));
        } catch (e) {
          throw Failure(e.toString());
        }
      }

      return recipes;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<RecipeModel>> getTrendingRecipes() async {
    try {
      final recipes = await getAllRecipes();
      return recipes.where((recipe) => recipe.isTrending).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<RecipeModel>> getRecommendedRecipes() async {
    try {
      final recipes = await getAllRecipes();
      return recipes.where((recipe) => recipe.isRecommended).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> toggleFavorite(String recipeId, bool isFavorite) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return;
      }

      final userFavoritesRef = firestore
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(recipeId);

      if (isFavorite) {
        await userFavoritesRef.set({
          'recipeId': recipeId,
          'userId': userId,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        await userFavoritesRef.delete();
      }
    } catch (e) {
      rethrow; // Rethrow to allow handling in UI
    }
  }

  @override
  Stream<List<RecipeModel>> getFavoriteRecipes() {
    final userId = _currentUserId;
    if (userId == null) {
      return Stream.value([]);
    }

    return firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .snapshots()
        .asyncMap((snapshot) async {
          final favoriteIds = snapshot.docs.map((doc) => doc.id).toList();

          if (favoriteIds.isEmpty) {
            return [];
          }

          List<RecipeModel> favoriteRecipes = [];

          // Get recipes individually
          for (final recipeId in favoriteIds) {
            final recipe = await getRecipeById(recipeId);
            if (recipe != null) {
              favoriteRecipes.add(recipe..isFavorite = true);
            }
          }

          return favoriteRecipes;
        });
  }

  @override
  Future<List<RecipeModel>> getUserRecipes() async {
    try {
      return await getAllRecipes();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> addRecipeToUser(RecipeModel recipe) {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return Future.error('No user logged in');
      }

      final userRecipesRef = firestore
          .collection('users')
          .doc(userId)
          .collection('recipes')
          .doc(recipe.id);

      return userRecipesRef.set(recipe.toJson());
    } catch (e) {
      return Future.error('Error adding recipe to user: $e');
    }
  }
}
