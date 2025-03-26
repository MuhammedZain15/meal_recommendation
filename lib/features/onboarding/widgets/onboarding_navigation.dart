import 'package:flutter/material.dart';
import '../../../core/utils/app_router.dart';
import 'navigation_button.dart';

import 'onboarding_dot.dart';

class OnboardingNavigation extends StatelessWidget {
  final int currentPage;
  final PageController pageController;
  final int totalPages;

  const OnboardingNavigation({
    super.key,
    required this.currentPage,
    required this.pageController,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationButton(
            isNext: false,
            currentPage: currentPage,
            totalPages: totalPages,
            pageController: pageController,
            loginRoute: AppRouter.kLoginView,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
              (index) => OnboardingDot(isActive: currentPage == index),
            ),
          ),

          NavigationButton(
            isNext: true,
            currentPage: currentPage,
            totalPages: totalPages,
            pageController: pageController,
            loginRoute: AppRouter.kLoginView,
          ),
        ],
      ),
    );
  }
}
