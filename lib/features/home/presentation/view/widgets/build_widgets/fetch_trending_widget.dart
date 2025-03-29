import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../logic/recipe_cubit.dart';

class FetchTrendingWidget extends StatelessWidget {
  const FetchTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is TrendingRecipesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TrendingRecipesLoaded) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.recipes.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final recipe = state.recipes[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kRecipeDetailsView, extra: recipe);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe Image
                    Container(
                      height: 150,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(recipe.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Recipe Title
                    Text(recipe.name, style: AppStyles.font16WBoldBlackColor),
                    // Recipe Info
                    Row(
                      children: [
                        Text(
                          '${recipe.ingredients.length} ingredients',
                          style: AppStyles.font12W500DarkGreyColor,
                        ),
                        const SizedBox(width: 10),
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
        } else {
          return const Center(child: Text('No trending recipes found'));
        }
      },
    );
  }
}
