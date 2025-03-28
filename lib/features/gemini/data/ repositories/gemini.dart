import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../datasources/gemini_api_service.dart';
import '../datasources/recipe_api_service.dart';
import '../models/recipe_model.dart';

class GeminiRepositoryImpl implements RecipeRepository {
  final GeminiApiService geminiApi;
  final RecipeApiService recipeApi;
  final FirebaseFirestore firestore;

  GeminiRepositoryImpl({
    required this.geminiApi,
    required this.recipeApi,
    required this.firestore,
  });

  @override
  Future<Recipe> fetchRecipe(String userId, String dishName) async {
    try {
      // Fetch recipe details from Gemini API
      final jsonData = await geminiApi.fetchRecipe(dishName);

      // Fetch meal image from Spoonacular API
      final imageUrl = await recipeApi.fetchRecipeImage(dishName) ?? '';

      // Assign image URL to recipe data
      jsonData['imageUrl'] = imageUrl;
      jsonData['userId'] = userId;

      // Convert JSON response to RecipeModel
      final recipeModel = RecipeModel.fromJson(jsonData, '');

      // Store in Firestore under user's collection
      final docRef = await firestore
          .collection('users')
          .doc(userId)
          .collection('recipes')
          .add(recipeModel.toJson());

      // Return Recipe with Firestore ID
      return RecipeModel.fromJson(jsonData, docRef.id);
    } catch (e) {
      print('Error fetching and saving recipe: $e');
      throw Exception('Failed to fetch and store recipe');
    }
  }

  @override
  Future<List<Recipe>> fetchUserRecipes(String userId) async {
    try {
      final querySnapshot = await firestore
          .collection('users')
          .doc(userId)
          .collection('recipes')
          .get();

      return querySnapshot.docs
          .map((doc) => RecipeModel.fromJson(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print('Error fetching user recipes: $e');
      throw Exception('Failed to fetch user recipes');
    }
  }
}
