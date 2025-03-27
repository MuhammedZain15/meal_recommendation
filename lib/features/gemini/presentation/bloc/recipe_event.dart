part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRecipeEvent extends RecipeEvent {
  final String userId;
  final String dishName;

  FetchRecipeEvent(this.userId, this.dishName);

  @override
  List<Object> get props => [userId, dishName];
}

class FetchUserRecipesEvent extends RecipeEvent {
  final String userId;

  FetchUserRecipesEvent(this.userId);

  @override
  List<Object> get props => [userId];
}
