import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendation/features/favorite/domain/entities/meal_entity.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<Meal>> fetchFavoriteMeals();
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final FirebaseFirestore firestore;

  FavoritesRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<Meal>> fetchFavoriteMeals() async {
    final snapshot = await firestore
        .collection("meals")
        .where("isFavorite", isEqualTo: true)
        .get();

    return snapshot.docs.map((doc) => Meal.fromFirestore(doc)).toList();
  }
}
