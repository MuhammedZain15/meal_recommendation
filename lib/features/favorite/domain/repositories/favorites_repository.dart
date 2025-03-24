import 'package:meal_recommendation/features/favorite/domain/entities/meal_entity.dart';

abstract class FavoritesRepository {
  Future<List<Meal>> getFavoriteMeals();
}
