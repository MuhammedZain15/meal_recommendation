part of 'recipe_cubit.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<RecipeModel> recipes;

  const RecipeLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

class TrendingRecipesLoading extends RecipeState {}

class TrendingRecipesLoaded extends RecipeState {
  final List<RecipeModel> recipes;

  const TrendingRecipesLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

class RecommendedRecipesLoading extends RecipeState {}

class RecommendedRecipesLoaded extends RecipeState {
  final List<RecipeModel> recipes;

  const RecommendedRecipesLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

class UserRecipesLoading extends RecipeState {}

class UserRecipesLoaded extends RecipeState {
  final List<RecipeModel> recipes;

  const UserRecipesLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

class FavoriteRecipesLoaded extends RecipeState {
  final List<RecipeModel> recipes;

  const FavoriteRecipesLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

class AddingRecipe extends RecipeState {}

class RecipeAdded extends RecipeState {}

class RecipeError extends RecipeState {
  final String message;

  const RecipeError({required this.message});

  @override
  List<Object> get props => [message];
}
