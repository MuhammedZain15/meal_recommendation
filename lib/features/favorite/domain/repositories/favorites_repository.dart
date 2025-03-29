import '../entities/meal_entity.dart';

abstract class FavoritesRepository {
  Future<List<Meal>> getFavoriteMeals();
}
