import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/services/service_locator.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_list.dart';

import '../../logic/recipe_cubit.dart';
import 'search_section.dart';
import 'add_ingredients_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RecipeCubit>()..loadAllRecipes(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 30),
                  Icon(Icons.notifications_outlined, size: 30),
                ],
              ),
              const SizedBox(height: 24),
              const SearchSection(),
              const SizedBox(height: 16),
              const AddIngredientsButton(),
              const SizedBox(height: 32),

              // Top Recipes Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Recipes",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(AppRouter.kSeeAllView);
                    },
                    child: const Text(
                      "see all",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Recipe List
              const Expanded(child: RecipeList()),
            ],
          ),
        ),
      ),
    );
  }
}
