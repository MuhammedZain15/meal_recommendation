import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import '../../logic/recipe_cubit.dart';

class TrendingRecipesSection extends StatelessWidget {
  const TrendingRecipesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is TrendingRecipesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TrendingRecipesLoaded) {
          if (state.recipes.isEmpty) {
            return const Center(child: Text('No trending recipes available'));
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.75,
            ),
            itemCount: state.recipes.length,
            itemBuilder: (context, index) {
              final recipe = state.recipes[index];
              return GestureDetector(
                onTap: () {
                  context.push(AppRouter.kRecipeDetailsView);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe Image
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(
                              recipe.imageUrl.isNotEmpty
                                  ? recipe.imageUrl
                                  : 'assets/images/food1.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Recipe Title
                    Text(
                      recipe.name,
                      style: AppStyles.font16WBoldBlackColor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Recipe Info
                    Row(
                      children: [
                        Text(
                          '${recipe.ingredients.length} ingredients',
                          style: AppStyles.font12W500DarkGreyColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${recipe.time}min',
                          style: AppStyles.font12W500PrimartColor,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is RecipeError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('No recipes available'));
      },
    );
  }
}
