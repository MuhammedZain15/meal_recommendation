import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: RecipeSearchDelegate());
      },
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(
                13,
              ), // Replace withOpacity with withAlpha
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.search, size: 24),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                AppStrings.kSearchRecipes,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(
                  26,
                ), // Replace withOpacity with withAlpha
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                FontAwesomeIcons.sliders,
                size: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
