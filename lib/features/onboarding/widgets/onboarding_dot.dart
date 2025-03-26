import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class OnboardingDot extends StatelessWidget {
  final bool isActive;

  const OnboardingDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 30,
      decoration: BoxDecoration(
        color: isActive ? AppColors.kPrimary : AppColors.kGrey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

