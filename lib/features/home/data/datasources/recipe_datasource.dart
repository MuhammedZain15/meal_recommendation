import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        print('Error fetching recipe from user collection: $e');
      }

      // If not found in user's collection, try public recipes
      if (recipeDoc == null || !recipeDoc.exists) {
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
      print('Error getting recipe by ID: $e');
      return null;
    }
  }

  @override
  Future<List<RecipeModel>> getAllRecipes() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        print('No user logged in, returning empty recipes list');
        return [];
      }

      print('Fetching all recipes for user: $userId');

      // Get user's recipes
      final userRecipesSnapshot =
          await firestore
              .collection('users')
              .doc(userId)
              .collection('recipes')
              .get();

      print('Found ${userRecipesSnapshot.docs.length} user recipes');

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

      print('Found ${userFavorites.length} favorites');

      // Process the recipes with favorite status
      List<RecipeModel> recipes = [];
      for (var doc in userRecipesSnapshot.docs) {
        try {
          Map<String, dynamic> data = doc.data();
          // Override isFavorite with user's actual favorites
          data['isFavorite'] = userFavorites.containsKey(doc.id);
          recipes.add(RecipeModel.fromJson(data, doc.id));
        } catch (e) {
          print('Error parsing recipe ${doc.id}: $e');
        }
      }

      return recipes;
    } catch (e) {
      print('Error getting all recipes: $e');
      return [];
    }
  }

  @override
  Future<List<RecipeModel>> getTrendingRecipes() async {
    try {
      final recipes = await getAllRecipes();
      return recipes.where((recipe) => recipe.isTrending).toList();
    } catch (e) {
      print('Error getting trending recipes: $e');
      return [];
    }
  }

  @override
  Future<List<RecipeModel>> getRecommendedRecipes() async {
    try {
      final recipes = await getAllRecipes();
      return recipes.where((recipe) => recipe.isRecommended).toList();
    } catch (e) {
      print('Error getting recommended recipes: $e');
      return [];
    }
  }

  @override
  Future<void> toggleFavorite(String recipeId, bool isFavorite) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        print('Cannot toggle favorite: No user logged in');
        return;
      }

      final userFavoritesRef = firestore
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(recipeId);

      if (isFavorite) {
        print('Adding recipe $recipeId to favorites');
        await userFavoritesRef.set({
          'recipeId': recipeId,
          'userId': userId,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        print('Removing recipe $recipeId from favorites');
        await userFavoritesRef.delete();
      }
    } catch (e) {
      print('Error toggling favorite: $e');
      throw e; // Rethrow to allow handling in UI
    }
  }

  @override
  Stream<List<RecipeModel>> getFavoriteRecipes() {
    final userId = _currentUserId;
    if (userId == null) {
      print('Cannot get favorite recipes: No user logged in');
      return Stream.value([]);
    }

    print('Setting up favorites stream for user $userId');
    return firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .snapshots()
        .asyncMap((snapshot) async {
          final favoriteIds = snapshot.docs.map((doc) => doc.id).toList();
          print('Found ${favoriteIds.length} favorite IDs');

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

          print('Retrieved ${favoriteRecipes.length} favorite recipes');
          return favoriteRecipes;
        });
  }

  @override
  Future<List<RecipeModel>> getUserRecipes() async {
    try {
      return await getAllRecipes();
    } catch (e) {
      print('Error getting user recipes: $e');
      return [];
    }
  }
  
  @override
  Future<void> addRecipeToUser(RecipeModel recipe) {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        print('Cannot add recipe to user: No user logged in');
        return Future.error('No user logged in');
      }

      final userRecipesRef = firestore
          .collection('users')
          .doc(userId)
          .collection('recipes')
          .doc(recipe.id);

      return userRecipesRef.set(recipe.toJson());
    } catch (e) {
      print('Error adding recipe to user: $e');
      return Future.error('Error adding recipe to user: $e');
    }
  }
}
