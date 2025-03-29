import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendation/features/gemini/presentation/pages/widgets/recipe_input.dart';
import 'package:meal_recommendation/features/gemini/presentation/pages/widgets/recipe_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/recipe_bloc.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  String? userId;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('userId');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipe Chat")),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state) {
                if (state is RecipeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RecipeLoaded) {
                  return ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Image.network(state.recipe.imageUrl),
                      const SizedBox(height: 10),
                      Text(
                        state.recipe.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.recipe.summary,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                } else if (state is RecipeError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const Center(child: Text("Search for a recipe"));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: RecipeTextField(controller: _controller)),
                const SizedBox(width: 10),
                RecipeButton(userId: userId, controller: _controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
