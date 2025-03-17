import 'package:flutter/material.dart';

import 'widgets/recipe_details_view_body.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RecipeDetailsViewBody(),
    );
  }
}