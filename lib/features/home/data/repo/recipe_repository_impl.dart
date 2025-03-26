import '../../domain/repos/recipe_repository.dart';
import '../datasources/recipe_datasource.dart';
import '../models/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource dataSource;

  RecipeRepositoryImpl({required this.dataSource});

  @override
  Future<List<RecipeModel>> getAllRecipes() {
    return dataSource.getAllRecipes();
  }

  @override
  Future<List<RecipeModel>> getTrendingRecipes() {
    return dataSource.getTrendingRecipes();
  }

  @override
  Future<List<RecipeModel>> getRecommendedRecipes() {
    return dataSource.getRecommendedRecipes();
  }

  @override
  Future<void> toggleFavorite(String recipeId, bool isFavorite) {
    return dataSource.toggleFavorite(recipeId, isFavorite);
  }

  @override
  Stream<List<RecipeModel>> getFavoriteRecipes() {
    return dataSource.getFavoriteRecipes();
  }

  @override
  Future<void> addRecipeToUser(RecipeModel recipe) {
    return dataSource.addRecipeToUser(recipe);
  }

  @override
  Future<List<RecipeModel>> getUserRecipes() {
    return dataSource.getUserRecipes();
  }

  @override
  Future<RecipeModel?> getRecipeById(String recipeId) {
    return dataSource.getRecipeById(recipeId);
  }
}
