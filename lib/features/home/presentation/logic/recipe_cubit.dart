import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/recipe_model.dart';
import '../../domain/repos/recipe_repository.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final RecipeRepository repository;

  RecipeCubit({required this.repository}) : super(RecipeInitial());

  Future<void> loadAllRecipes() async {
    try {
      emit(RecipeLoading());
      final recipes = await repository.getAllRecipes();
      emit(RecipeLoaded(recipes: recipes));
    } catch (e) {
      emit(RecipeError(message: e.toString()));
    }
  }

  Future<void> loadTrendingRecipes() async {
    try {
      emit(TrendingRecipesLoading());
      final trendingRecipes = await repository.getTrendingRecipes();
      emit(TrendingRecipesLoaded(recipes: trendingRecipes));
    } catch (e) {
      emit(RecipeError(message: e.toString()));
    }
  }

  Future<void> loadRecommendedRecipes() async {
    try {
      emit(RecommendedRecipesLoading());
      final recommendedRecipes = await repository.getRecommendedRecipes();
      emit(RecommendedRecipesLoaded(recipes: recommendedRecipes));
    } catch (e) {
      emit(RecipeError(message: e.toString()));
    }
  }

  Future<void> toggleFavorite(String recipeId, bool isFavorite) async {
    try {
      // Update optimistically in current state
      _updateFavoriteStatusInState(recipeId, isFavorite);

      // Then actually update in database
      await repository.toggleFavorite(recipeId, isFavorite);

      // Load favorite recipes to update favorite view
      loadFavoriteRecipes();
    } catch (e) {
      // If failed, revert the optimistic update
      _updateFavoriteStatusInState(recipeId, !isFavorite);
      emit(RecipeError(message: e.toString()));
    }
  }

  void _updateFavoriteStatusInState(String recipeId, bool isFavorite) {
    if (state is RecipeLoaded) {
      final currentRecipes = (state as RecipeLoaded).recipes;
      final updatedRecipes =
          currentRecipes.map((recipe) {
            if (recipe.id == recipeId) {
              recipe.isFavorite = isFavorite;
            }
            return recipe;
          }).toList();

      emit(RecipeLoaded(recipes: updatedRecipes));
    } else if (state is TrendingRecipesLoaded) {
      final currentRecipes = (state as TrendingRecipesLoaded).recipes;
      final updatedRecipes =
          currentRecipes.map((recipe) {
            if (recipe.id == recipeId) {
              recipe.isFavorite = isFavorite;
            }
            return recipe;
          }).toList();

      emit(TrendingRecipesLoaded(recipes: updatedRecipes));
    } else if (state is RecommendedRecipesLoaded) {
      final currentRecipes = (state as RecommendedRecipesLoaded).recipes;
      final updatedRecipes =
          currentRecipes.map((recipe) {
            if (recipe.id == recipeId) {
              recipe.isFavorite = isFavorite;
            }
            return recipe;
          }).toList();

      emit(RecommendedRecipesLoaded(recipes: updatedRecipes));
    } else if (state is UserRecipesLoaded) {
      final currentRecipes = (state as UserRecipesLoaded).recipes;
      final updatedRecipes =
          currentRecipes.map((recipe) {
            if (recipe.id == recipeId) {
              recipe.isFavorite = isFavorite;
            }
            return recipe;
          }).toList();

      emit(UserRecipesLoaded(recipes: updatedRecipes));
    } else if (state is FavoriteRecipesLoaded) {
      // For favorites, if unfavoriting, we'll remove from the list
      if (!isFavorite) {
        final currentRecipes = (state as FavoriteRecipesLoaded).recipes;
        final updatedRecipes =
            currentRecipes.where((recipe) => recipe.id != recipeId).toList();
        emit(FavoriteRecipesLoaded(recipes: updatedRecipes));
      }
      // If favoriting, we'll let the loadFavoriteRecipes handle adding it
    }
  }

  Future<void> loadUserRecipes() async {
    try {
      emit(RecipeLoading());
      final userRecipes = await repository.getUserRecipes();
      emit(UserRecipesLoaded(recipes: userRecipes));
    } catch (e) {
      emit(RecipeError(message: e.toString()));
    }
  }

  void loadFavoriteRecipes() {
    emit(RecipeLoading());
    repository.getFavoriteRecipes().listen(
      (favorites) {
        emit(FavoriteRecipesLoaded(recipes: favorites));
      },
      onError: (error) {
        emit(RecipeError(message: error.toString()));
      },
    );
  }
}
