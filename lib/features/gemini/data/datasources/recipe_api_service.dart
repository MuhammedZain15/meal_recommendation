import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RecipeApiService {
  Future<String?> fetchRecipeImage(String dishName) async {
    final apiKey = dotenv.env['SPOONACULAR_API_KEY'];
    final url = Uri.parse(
      'https://api.apilayer.com/spoonacular/recipes/complexSearch?query=$dishName',
    );

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json', 'apikey': apiKey!},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results']?.isNotEmpty == true
          ? data['results'][0]['image']
          : null;
    }
    return null;
  }
}
