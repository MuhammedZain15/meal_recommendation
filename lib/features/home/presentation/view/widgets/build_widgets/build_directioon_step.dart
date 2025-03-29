import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

Widget buildDirectionStep(int stepNumber, String instruction) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kPrimary,
          ),
          child: Text(
            stepNumber.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            instruction,
            style: const TextStyle(fontSize: 16, color: AppColors.kDarkGrey),
          ),
        ),
      ],
    ),
  );
}