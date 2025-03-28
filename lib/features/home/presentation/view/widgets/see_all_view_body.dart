import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/styled_recipe_card.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';

import '../../logic/recipe_cubit.dart';

class SeeAllViewBody extends StatelessWidget {
  const SeeAllViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Trending Recipes Title
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
            child: Text(
              "Trending Recipes",
              style: AppStyles.font21W700PrimaryColor,
            ),
          ),

          // Trending Recipes Horizontal List
          SizedBox(
            height: 220,
            child: BlocBuilder<RecipeCubit, RecipeState>(
              builder: (context, state) {
                if (state is TrendingRecipesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TrendingRecipesLoaded) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.recipes.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final recipe = state.recipes[index];
                      return GestureDetector(
                        onTap: () {
                          context.push(AppRouter.kRecipeDetailsView);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Recipe Image
                            Container(
                              height: 150,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                    recipe.imageUrl.isNotEmpty
                                        ? recipe.imageUrl
                                        : 'assets/images/food1.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Recipe Title
                            Text(
                              recipe.name,
                              style: AppStyles.font16WBoldBlackColor,
                            ),
                            // Recipe Info
                            Row(
                              children: [
                                Text(
                                  '${recipe.ingredients.length} ingredients',
                                  style: AppStyles.font12W500DarkGreyColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${recipe.time}min',
                                  style: AppStyles.font12W500PrimartColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No trending recipes found'));
                }
              },
            ),
          ),

          const SizedBox(height: 30),

          // Recommended Recipes Title
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
            child: Text(
              "Recommended for you",
              style: AppStyles.font21W700PrimaryColor,
            ),
          ),

          // Recommended Recipes Vertical List
          BlocBuilder<RecipeCubit, RecipeState>(
            builder: (context, state) {
              if (state is RecommendedRecipesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RecommendedRecipesLoaded) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.recipes.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
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
                      rating: 4,
                      isFavorite: recipe.isFavorite,
                      recipeId: recipe.id,
                      onTap: () {
                        context.push(AppRouter.kRecipeDetailsView);
                      },
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No recommended recipes found'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
