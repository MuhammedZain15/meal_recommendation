import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/recipe.dart';
import '../../domain/usecases/fetch_recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final FetchRecipeUseCase fetchRecipeUseCase;

  RecipeBloc({required this.fetchRecipeUseCase}) : super(RecipeInitial()) {
    on<FetchRecipeEvent>((event, emit) async {
      emit(RecipeLoading());
      try {
        final recipe =
            await fetchRecipeUseCase.execute(event!.userId, event!.dishName);
        emit(RecipeLoaded(recipe));
      } catch (e) {
        emit(RecipeError('Failed to fetch recipe'));
      }
    });

/*    on<FetchUserRecipesEvent>((event, emit) async {
      emit(RecipeLoading());
      try {
        final recipes =
            await fetchRecipeUseCase.repository.fetchRecipe(userId, dishName);
        emit(UserRecipesLoaded(recipes));
      } catch (e) {
        emit(RecipeError('Failed to fetch user recipes'));
      }
    });*/
  }
}
