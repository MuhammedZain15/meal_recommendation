// lib/features/home/presentation/view/see_all_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/styled_app_bar.dart';
import 'package:meal_recommendation/core/services/service_locator.dart';
import '../logic/recipe_cubit.dart';
import 'widgets/see_all_view_body.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<RecipeCubit>()
                ..loadTrendingRecipes()
                ..loadRecommendedRecipes(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                StyledAppBar(
                  onLeadingTap: () => context.pop(),
                  leadingIcon: Icons.arrow_back,
                ),
                const Expanded(child: SeeAllViewBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
