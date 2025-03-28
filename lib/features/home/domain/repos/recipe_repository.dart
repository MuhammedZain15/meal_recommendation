import '../../data/models/recipe_model.dart';

abstract class RecipeRepository {
  Future<List<RecipeModel>> getAllRecipes();
  Future<List<RecipeModel>> getTrendingRecipes();
  Future<List<RecipeModel>> getRecommendedRecipes();
  Future<void> toggleFavorite(String recipeId, bool isFavorite);
  Stream<List<RecipeModel>> getFavoriteRecipes();
  Future<RecipeModel?> getRecipeById(String recipeId);
  Future<List<RecipeModel>> getUserRecipes();
  Future<void> addRecipeToUser(RecipeModel recipe);
}
