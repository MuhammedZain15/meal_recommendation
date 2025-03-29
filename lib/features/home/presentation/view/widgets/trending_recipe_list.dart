import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/components/styled_recipe_list_view_item.dart';
import '../../../data/models/recipe_model.dart';

class TrendingRecipeList extends StatelessWidget {
  final List<RecipeModel> recipes;

  const TrendingRecipeList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return const Center(child: Text('No trending recipes available'));
    }

    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return StyledRecipeListViewItem(
            image:
                recipe.imageUrl.isNotEmpty
                    ? recipe.imageUrl
                    : 'assets/images/food1.png',
            // Fallback image
            title: recipe.name,
            ingredientsCount: recipe.ingredients.length,
            time: recipe.time,
            isTrending: true,
            onTap: () {
              context.push(AppRouter.kRecipeDetailsView, extra: recipe);
            },
          );
        },
      ),
    );
  }
}
