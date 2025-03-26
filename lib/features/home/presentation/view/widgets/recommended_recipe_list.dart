import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/components/styled_recipe_card.dart';
import '../../../data/models/recipe_model.dart';

class RecommendedRecipeList extends StatelessWidget {
  final List<RecipeModel> recipes;

  const RecommendedRecipeList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return const Center(child: Text('No recommended recipes available'));
    }

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return StyledRecipeCard(
          image:
              recipe.imageUrl.isNotEmpty
                  ? recipe.imageUrl
                  : 'assets/images/food1.png', // Fallback image
          title: recipe.typeOfMeal,
          subtitle: recipe.name,
          ingredientsCount: recipe.ingredients.length,
          time: recipe.time,
          rating: 4, // Default rating - could be dynamic in the future
          isFavorite: recipe.isFavorite,
          recipeId: recipe.id,
          onTap: () {
            context.push(AppRouter.kRecipeDetailsView);
          },
        );
      },
    );
  }
}
