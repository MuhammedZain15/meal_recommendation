import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_search_delegate.dart';

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
