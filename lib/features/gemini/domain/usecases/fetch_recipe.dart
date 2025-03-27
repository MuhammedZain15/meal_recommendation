import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';

class FetchRecipeUseCase {
  final RecipeRepository repository;

  FetchRecipeUseCase({required this.repository});

  Future<Recipe> execute(String userId, String dishName) async {
    return await repository.fetchRecipe(userId, dishName);
  }
}
