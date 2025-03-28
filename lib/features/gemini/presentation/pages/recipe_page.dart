import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/recipe_bloc.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Recipe")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<RecipeBloc, RecipeState>(
                builder: (context, state) {
                  if (state is RecipeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RecipeLoaded) {
                    return Column(
                      spacing: 16,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              state.recipe.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          state.recipe.name,
                          style: AppStyles.font20BoldBlackColor,
                        ),
                        Text(
                          state.recipe.summary,
                          style: AppStyles.font15Ww500DarkGreyColor.copyWith(
                            color: Colors.grey.shade800
                          ),
                        ),
                      ],
                    );
                  } else if (state is RecipeError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text("Search for a recipe"));
                },
              ),
      
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter dish name",
      
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      final userId = prefs.getString("userId");
      
                      if (!context.mounted) return;
                      context.read<RecipeBloc>().add(
                        FetchRecipeEvent(userId!, _controller.text),
                      );
                      _controller.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     final prefs = await SharedPreferences.getInstance();
        //     final userId = prefs.getString("userId");
      
        //     if (!context.mounted) return;
        //     context.read<RecipeBloc>().add(
        //       FetchRecipeEvent(userId!, _controller.text),
        //     );
        //   },
        //   child: const Icon(Icons.search),
        // ),
      ),
    );
  }
}
