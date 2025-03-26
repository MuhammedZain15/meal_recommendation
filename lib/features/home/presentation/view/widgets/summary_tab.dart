import 'package:flutter/material.dart';
import 'nutrition_item.dart';

class SummaryTab extends StatelessWidget {
  const SummaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum ",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              "Nutritions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 25,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              shrinkWrap: true, // Allows GridView to take only needed space
              physics:
                  const NeverScrollableScrollPhysics(), // Prevents scrolling issues
              children: const [
                NutritionItem(title: "protein", value: "40g"),
                NutritionItem(title: "carp", value: "40g"),
                NutritionItem(title: "fat", value: "40g"),
                NutritionItem(title: "kcal", value: "400"),
                NutritionItem(title: "vitamines", value: "20mg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
