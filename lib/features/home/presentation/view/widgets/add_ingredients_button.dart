import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';

class AddIngredientsButton extends StatelessWidget {
  const AddIngredientsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kGemini);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.kPrimary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Text(
          AppStrings.kAddYourIngredients,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

