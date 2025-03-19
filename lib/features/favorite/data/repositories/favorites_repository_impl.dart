import 'package:meal_recommendation/features/favorite/data/data_sources/favorites_remote_data_source.dart';
import 'package:meal_recommendation/features/favorite/domain/entities/meal_entity.dart';

import '../../domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Meal>> getFavoriteMeals() {
    return remoteDataSource.fetchFavoriteMeals();
  }
}
