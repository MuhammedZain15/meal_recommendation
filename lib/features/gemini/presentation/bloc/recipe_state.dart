part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final Recipe recipe;

  RecipeLoaded(this.recipe);

  @override
  List<Object> get props => [recipe];
}

class UserRecipesLoaded extends RecipeState {
  final List<Recipe> recipes;

  UserRecipesLoaded(this.recipes);

  @override
  List<Object> get props => [recipes];
}

class RecipeError extends RecipeState {
  final String message;

  RecipeError(this.message);

  @override
  List<Object> get props => [message];
}
