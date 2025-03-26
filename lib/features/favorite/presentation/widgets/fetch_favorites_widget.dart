import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/styled_recipe_card.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/features/favorite/presentation/controller/favorites_bloc.dart';
import 'package:meal_recommendation/features/favorite/presentation/controller/favorites_state.dart';

class FetchFavoritesWidget extends StatelessWidget {
  const FetchFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoritesSuccessState) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: state.meals.length,
            itemBuilder: (context, index) {
              final meal = state.meals[index];
              return StyledRecipeCard(
                image: meal.image,
                title: meal.title,
                subtitle: meal.subtitle,
                ingredientsCount: meal.ingredientsCount,
                time: meal.time,
                rating: meal.rating,
                isFavorite: meal.isFavorite,
                recipeId: meal.id, // Added recipeId
                onTap: () {
                  context.push(AppRouter.kRecipeDetailsView);
                },
              );
            },
          );
        } else if (state is FavoritesErrorState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text("No favorites yet"));
        }
      },
    );
  }
}
