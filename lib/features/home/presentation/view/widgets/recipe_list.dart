import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_card_item.dart';

import '../../../../../core/utils/app_router.dart';
import '../../logic/recipe_cubit.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is RecipeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecipeLoaded) {
          if (state.recipes.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No recipes available', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text(
                    'Check your Firebase connection or login',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: state.recipes.length,
            itemBuilder: (context, index) {
              final recipe = state.recipes[index];
              return RecipeCardItem(
                recipe: recipe,
                onTap: () {
                  // Navigate to recipe details with recipe data
                  context.push(AppRouter.kRecipeDetailsView, extra: recipe);
                },
              );
            },
          );
        } else if (state is RecipeError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Error loading recipes',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  state.message,
                  style: const TextStyle(fontSize: 14, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        // Trigger loading recipes if no state is matched
        context.read<RecipeCubit>().loadAllRecipes();
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
