
import '../../../home/data/models/recipe_model.dart';

abstract class RecipeRepository {
  Future<RecipeModel> fetchRecipe(String userId, String dishName);
}
