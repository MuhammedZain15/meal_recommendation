import 'dart:convert';

import 'package:http/http.dart' as http;

class RecipeApiService {
  final String apiKey = "c30fe8f3a6574f2bb34aeb58cde6f6de" ;

  RecipeApiService();

  Future<String?> fetchRecipeImage(String dishName) async {
    final url = Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?query=$dishName&apiKey=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results']?.isNotEmpty == true
          ? data['results'][0]['image']
          : null;
    }
    return null;
  }
}
