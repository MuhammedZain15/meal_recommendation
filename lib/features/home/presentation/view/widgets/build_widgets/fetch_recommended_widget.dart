import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/components/styled_recipe_card.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../logic/recipe_cubit.dart';

class FetchRecommendedWidget extends StatelessWidget {
  const FetchRecommendedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
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
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kRecipeDetailsView, extra: recipe);
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
    );
  }
}