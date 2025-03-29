import 'package:flutter/material.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_details_widgets/recipe_directions.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_details_widgets/recipe_image_header.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_details_widgets/recipe_ingredients.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_details_widgets/recipe_nutrition.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_details_widgets/recipe_summary.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_details_widgets/recipe_title_and_time.dart';
import '../../../data/models/recipe_model.dart';

class RecipeDetailsViewBody extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsViewBody({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RecipeImageHeader(recipe: recipe),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeTitleAndTime(recipe: recipe),
                RecipeSummary(recipe: recipe),
                RecipeIngredients(recipe: recipe),
                RecipeDirections(recipe: recipe),
                RecipeNutrition(recipe: recipe),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
