import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'recipe_data_source.dart';

class GeminiApiService implements RecipeDataSource {
  final String apiKey = "AIzaSyC_mVY7x4XkUsWrkQTdNZdxYWoGWyrzaic";

  GeminiApiService();

  @override
  Future<Map<String, dynamic>> fetchRecipe(String dishName) async {
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final prompt = '''
    Provide a JSON recipe for "$dishName" with:
    {
      "name": "Dish name",
      "summary": "Summary",
      "typeOfMeal": "Meal type",
      "time": "Preparation time in minutes",
      "imageUrl": "",
      "ingredients": [{ "name": "Ingredient", "quantity": "1", "unit": "cup", "imageUrl": "" }],
      "nutrition": { "calories": "200", "protein": "10g", "carbs": "30g", "fat": "5g", "vitamins": ["A", "C"] },
      "directions": { "firstStep": "Step 1", "secondStep": "Step 2", "additionalSteps": ["Step 3"] }
    }
    ''';

    final response = await model.generateContent([Content.text(prompt)]);
    final cleanedResponse =
    response.text?.replaceAll('```json', '').replaceAll('```', '').trim();
    return json.decode(cleanedResponse ?? "{}");
  }

  @override
  Future<String?> fetchRecipeImage(String dishName) async {
    return null;
  }
}
