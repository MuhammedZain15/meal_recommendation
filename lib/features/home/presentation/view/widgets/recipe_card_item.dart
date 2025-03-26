import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/components/is_favorite_widget.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';

import '../../../data/models/recipe_model.dart';

class RecipeCardItem extends StatelessWidget {
  final RecipeModel recipe;
  final VoidCallback onTap;

  const RecipeCardItem({super.key, required this.recipe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Recipe Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  recipe.imageUrl.isNotEmpty
                      ? recipe.imageUrl
                      : 'assets/images/food1.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // Recipe Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe Type and Name
                    Text(
                      recipe.typeOfMeal.toLowerCase(),
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      recipe.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Recipe Ingredients and Time
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "${recipe.ingredients.length} ingredients",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "${recipe.time}min",
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.kPrimary,
                          ),
                        ),
                      ],
                    ),

                    // Recipe Rating
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: index < 4 ? Colors.amber : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Favorite Button
              IsFavoriteWidget(
                isFavorite: recipe.isFavorite,
                recipeId: recipe.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
