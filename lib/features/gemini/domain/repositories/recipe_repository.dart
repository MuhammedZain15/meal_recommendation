import '../entities/recipe.dart';

abstract class RecipeRepository {
  Future<Recipe> fetchRecipe(String userId, String dishName);
}
