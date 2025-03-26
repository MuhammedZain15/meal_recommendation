import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/styled_app_bar.dart';
import 'package:meal_recommendation/core/components/styled_recipe_card.dart';
import 'package:meal_recommendation/core/services/service_locator.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';

import '../../../home/presentation/logic/recipe_cubit.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RecipeCubit>()..loadFavoriteRecipes(),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 20.0.h, left: 10.w, right: 10.w),
                child: Column(
                  children: [
                    SizedBox(height: 60.h, child: const StyledAppBar()),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: BlocBuilder<RecipeCubit, RecipeState>(
                        builder: (context, state) {
                          if (state is RecipeLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is FavoriteRecipesLoaded) {
                            if (state.recipes.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No favorite recipes yet. Add some!',
                                ),
                              );
                            }

                            return ListView.separated(
                              separatorBuilder:
                                  (context, index) => SizedBox(height: 10.h),
                              itemCount: state.recipes.length,
                              itemBuilder: (context, index) {
                                final recipe = state.recipes[index];
                                return StyledRecipeCard(
                                  image:
                                      recipe.imageUrl.isNotEmpty
                                          ? recipe.imageUrl
                                          : 'assets/images/food1.png',
                                  title: recipe.typeOfMeal,
                                  subtitle: recipe.name,
                                  ingredientsCount: recipe.ingredients.length,
                                  time: recipe.time,
                                  rating: 4, // Default rating
                                  isFavorite: true, // Always true in favorites
                                  recipeId: recipe.id,
                                  onTap: () {
                                    context.push(
                                      AppRouter.kRecipeDetailsView,
                                      extra: recipe,
                                    );
                                  },
                                );
                              },
                            );
                          } else if (state is RecipeError) {
                            return Center(
                              child: Text('Error: ${state.message}'),
                            );
                          }
                          return const Center(
                            child: Text('Loading favorites...'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
