import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';
import '../../../../data/models/recipe_model.dart';
import '../build_widgets/build_section.dart';

class RecipeIngredients extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeIngredients({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return buildSection(
      title: AppStrings.kIngredients,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: recipe.ingredients.map((ingredient) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    '${ingredient.name} (${ingredient.quantity} ${ingredient.unit})',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
