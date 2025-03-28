import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllPressed;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.font21W700PrimaryColor),
        TextButton(
          onPressed: onSeeAllPressed,
          child: const Text(
            AppStrings.kSeeAll,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.kPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
