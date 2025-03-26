import '../../domain/entities/meal_entity.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../data_sources/favorites_remote_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Meal>> getFavoriteMeals() {
    return remoteDataSource.fetchFavoriteMeals();
  }
}
