abstract class RecipeDataSource {
  Future<Map<String, dynamic>> fetchRecipe(String dishName);
  Future<String?> fetchRecipeImage(String dishName);
}
