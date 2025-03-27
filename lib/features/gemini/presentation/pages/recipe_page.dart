import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recipe_bloc.dart';

class RecipePage extends StatelessWidget {
  final String userId;
  final String dishName;

  const RecipePage({Key? key, required this.userId, required this.dishName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe")),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RecipeLoaded) {
            return Column(
              children: [
                Image.network(state.recipe.imageUrl),
                Text(state.recipe.name),
                Text(state.recipe.summary),
              ],
            );
          } else if (state is RecipeError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("Search for a recipe"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RecipeBloc>().add(FetchRecipeEvent(userId, dishName));
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
