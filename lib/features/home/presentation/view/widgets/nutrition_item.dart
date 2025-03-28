import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class NutritionItem extends StatelessWidget {
  final String title;
  final String value;

  const NutritionItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.kPrimary, width: 4),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: AppColors.kPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
