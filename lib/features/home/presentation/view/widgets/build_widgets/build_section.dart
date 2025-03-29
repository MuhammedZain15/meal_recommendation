import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

Widget buildSection({required String title, required Widget child}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.kPrimary,
        ),
      ),
      const SizedBox(height: 12),
      child,
    ],
  );
}
