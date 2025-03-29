import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendation/core/services/service_locator.dart';
import '../../data/models/recipe_model.dart';
import '../logic/recipe_cubit.dart';
import 'widgets/recipe_details_view_body.dart';

class RecipeDetailsView extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RecipeCubit>(),
      child: Scaffold(
        body: SafeArea(child: RecipeDetailsViewBody(recipe: recipe)),
      ),
    );
  }
}
