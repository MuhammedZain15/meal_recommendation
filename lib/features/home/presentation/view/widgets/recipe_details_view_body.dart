import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';

import '../../../data/models/recipe_model.dart';
import '../../logic/recipe_cubit.dart';

class RecipeDetailsViewBody extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsViewBody({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App Bar
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              recipe.imageUrl.isNotEmpty
                  ? recipe.imageUrl
                  : 'assets/images/food1.png',
              fit: BoxFit.cover,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          actions: [
            IconButton(
              icon: Icon(
                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: recipe.isFavorite ? Colors.red : Colors.white,
              ),
              onPressed: () {
                context.read<RecipeCubit>().toggleFavorite(
                  recipe.id,
                  !recipe.isFavorite,
                );
              },
            ),
          ],
        ),

        // Recipe Content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe Title and Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        recipe.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimary,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kPrimary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${recipe.time} ${AppStrings.kMin}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Summary
                _buildSection(
                  title: AppStrings.kSummary,
                  child: Text(
                    recipe.summary,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.kDarkGrey,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Ingredients
                _buildSection(
                  title: AppStrings.kIngredients,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        recipe.ingredients.map((ingredient) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.kPrimary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  '${ingredient.name} (${ingredient.quantity} ${ingredient.unit})',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.kDarkGrey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                // Directions
                _buildSection(
                  title: AppStrings.kDirections,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDirectionStep(1, recipe.directions.firstStep),
                      _buildDirectionStep(2, recipe.directions.secondStep),
                      ...List.generate(
                        recipe.directions.additionalSteps.length,
                        (index) => _buildDirectionStep(
                          index + 3,
                          recipe.directions.additionalSteps[index],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Nutrition
                _buildSection(
                  title: 'Nutrition',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNutritionRow('Calories', recipe.nutrition.calories),
                      _buildNutritionRow(
                        'Protein',
                        '${recipe.nutrition.protein}g',
                      ),
                      _buildNutritionRow('Carbs', '${recipe.nutrition.carbs}g'),
                      _buildNutritionRow('Fat', '${recipe.nutrition.fat}g'),
                      const SizedBox(height: 8),
                      Text(
                        'Vitamins: ${recipe.nutrition.vitamins.join(", ")}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.kDarkGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.kPrimary,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }

  Widget _buildDirectionStep(int stepNumber, String instruction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kPrimary,
            ),
            child: Text(
              stepNumber.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              instruction,
              style: const TextStyle(fontSize: 16, color: AppColors.kDarkGrey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.kDarkGrey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: AppColors.kDarkGrey),
          ),
        ],
      ),
    );
  }
}
