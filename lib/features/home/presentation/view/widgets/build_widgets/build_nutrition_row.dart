import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';


Widget buildNutritionRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.kDarkGrey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: AppColors.kDarkGrey),
        ),
      ],
    ),
  );
}