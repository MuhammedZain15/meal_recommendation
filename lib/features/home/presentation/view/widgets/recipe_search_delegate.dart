import 'package:flutter/material.dart';

class RecipeSearchDelegate extends SearchDelegate<String> {
  final List<String> dummyRecipes = [
    'Vegan Italian Pizza',
    'Grilled Salmon',
    'Avocado Toast',
    'Classic Steak',
    'Shawarma',
    'Burger',
    'Pasta Carbonara',
    'Chicken Curry',
    'Beef Tacos',
    'Sushi Roll',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> results =
    dummyRecipes
        .where(
          (recipe) => recipe.toLowerCase().contains(query.toLowerCase()),
    )
        .toList();

    return _buildSearchResults(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions =
    query.isEmpty
        ? [] // No suggestions when query is empty
        : dummyRecipes
        .where(
          (recipe) =>
          recipe.toLowerCase().contains(query.toLowerCase()),
    )
        .toList();

    return _buildSearchResults(suggestions);
  }

  Widget _buildSearchResults(List<String> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          leading: const Icon(Icons.food_bank),
          onTap: () {
            // Here you would navigate to the recipe details
            close(context, results[index]);
          },
        );
      },
    );
  }
}