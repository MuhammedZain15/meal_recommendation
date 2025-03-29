import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';

import '../../../../data/models/recipe_model.dart' show RecipeModel;
import '../build_widgets/build_section.dart';

class RecipeSummary extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeSummary({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return buildSection(
      title: AppStrings.kSummary,
      child: Text(
        recipe.summary,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
