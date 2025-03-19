
import 'package:meal_recommendation/features/favorite/domain/entities/meal_entity.dart';


abstract class FavoritesState {}

class FavoritesInitialState extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesSuccessState extends FavoritesState {
  final List<Meal> meals;
  FavoritesSuccessState(this.meals);
}

class FavoritesErrorState extends FavoritesState {
  final String message;

  FavoritesErrorState(this.message);
}
