import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';

class NavigationButton extends StatelessWidget {
  final bool isNext;
  final int currentPage;
  final int totalPages;
  final PageController pageController;
  final String loginRoute;

  const NavigationButton({
    super.key,
    required this.isNext,
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
    required this.loginRoute,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (isNext) {
          if (currentPage == totalPages - 1) {
            GoRouter.of(context).pushReplacement(loginRoute);
          } else {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        } else {
          if (currentPage == 0) {
            GoRouter.of(context).pushReplacement(loginRoute);
          } else {
            pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      child: Text(
        style: TextStyle(
          color: AppColors.kPrimary,
          fontWeight: FontWeight.w700,
        ),
        isNext
            ? (currentPage == totalPages - 1
                ? AppStrings.kLogin
                : AppStrings.kNext)
            : (currentPage > 0 ? AppStrings.kPrev : AppStrings.kSkip),
      ),
    );
  }
}
