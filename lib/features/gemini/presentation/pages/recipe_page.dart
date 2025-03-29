import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/features/gemini/presentation/pages/widgets/fetch_gemini_widget.dart';
import 'package:meal_recommendation/features/gemini/presentation/pages/widgets/recipe_input.dart';
import 'package:meal_recommendation/features/gemini/presentation/pages/widgets/recipe_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      appBar: AppBar(
        title: const Text("Recipe Chat"),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(AppRouter.kLayoutView);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          const Expanded(child: FetchGeminiWidget()),
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
