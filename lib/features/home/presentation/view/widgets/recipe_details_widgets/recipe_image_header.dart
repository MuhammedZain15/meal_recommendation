import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/recipe_model.dart' show RecipeModel;
import '../../../logic/recipe_cubit.dart';

class RecipeImageHeader extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeImageHeader({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: recipe.imageUrl,
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
    );
  }
}
