import 'package:flutter/material.dart';

import '../../../../data/models/recipe_model.dart' show RecipeModel;
import '../build_widgets/build_nutrition_row.dart';
import '../build_widgets/build_section.dart';

class RecipeNutrition extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeNutrition({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return buildSection(
      title: 'Nutrition',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNutritionRow('Calories', recipe.nutrition.calories),
          buildNutritionRow('Protein', '${recipe.nutrition.protein}g'),
          buildNutritionRow('Carbs', '${recipe.nutrition.carbs}g'),
          buildNutritionRow('Fat', '${recipe.nutrition.fat}g'),
          const SizedBox(height: 8),
          Text(
            'Vitamins: ${recipe.nutrition.vitamins.join(", ")}',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
