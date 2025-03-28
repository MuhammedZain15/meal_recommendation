import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';

import '../../logic/recipe_cubit.dart';
import 'recommended_recipe_list.dart';
import 'section_header.dart';
import 'trending_recipe_list.dart';

class RecipeSections extends StatelessWidget {
  const RecipeSections({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Trending Recipes Section
          SectionHeader(
            title: AppStrings.kTrendingRecipes,
            onSeeAllPressed: () {
              context.push(AppRouter.kSeeAllView);
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<RecipeCubit, RecipeState>(
            builder: (context, state) {
              if (state is TrendingRecipesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TrendingRecipesLoaded) {
                return TrendingRecipeList(recipes: state.recipes);
              } else if (state is RecipeError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const SizedBox();
            },
          ),

          const SizedBox(height: 32),

          // Recommended Recipes Section
          SectionHeader(
            title: AppStrings.kRecommendedRecipes,
            onSeeAllPressed: () {
              context.push(AppRouter.kSeeAllView);
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<RecipeCubit, RecipeState>(
            builder: (context, state) {
              if (state is RecommendedRecipesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RecommendedRecipesLoaded) {
                return RecommendedRecipeList(recipes: state.recipes);
              } else if (state is RecipeError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
