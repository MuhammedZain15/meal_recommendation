
import 'package:meal_recommendation/features/favorite/domain/entities/meal_entity.dart';

import '../repositories/favorites_repository.dart';

class GetFavoriteMeals {
  final FavoritesRepository repository;

  GetFavoriteMeals(this.repository);

  Future<List<Meal>> call() {
    return repository.getFavoriteMeals();
  }
}
