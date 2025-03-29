import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendation/features/favorite/domain/use_cases/get_favorite_meals_use_case.dart';
import 'package:meal_recommendation/features/favorite/presentation/controller/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoriteMeals getFavoriteMeals;

  FavoritesCubit(this.getFavoriteMeals) : super(FavoritesInitialState());

  Future<void> fetchFavorites() async {
    emit(FavoritesLoadingState());
    try {
      final meals = await getFavoriteMeals();
      emit(FavoritesSuccessState(meals));
    } catch (e) {
      emit(FavoritesErrorState(e.toString()));
    }
  }
}
