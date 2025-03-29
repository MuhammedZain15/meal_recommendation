
import '../../../home/data/models/recipe_model.dart';
import '../repositories/recipe_repository.dart';

class FetchRecipeUseCase {
  final RecipeRepository repository;

  FetchRecipeUseCase({required this.repository});

  Future<RecipeModel> execute(String userId, String dishName) async {
    return await repository.fetchRecipe(userId, dishName);
  }
}
