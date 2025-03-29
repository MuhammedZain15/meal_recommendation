import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';

import '../../../../data/models/recipe_model.dart';
import '../build_widgets/build_directioon_step.dart';
import '../build_widgets/build_section.dart';

class RecipeDirections extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDirections({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return buildSection(
      title: AppStrings.kDirections,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDirectionStep(1, recipe.directions.firstStep),
          buildDirectionStep(2, recipe.directions.secondStep),
          ...List.generate(
            recipe.directions.additionalSteps.length,
                (index) => buildDirectionStep(
              index + 3,
              recipe.directions.additionalSteps[index],
            ),
          ),
        ],
      ),
    );
  }
}
