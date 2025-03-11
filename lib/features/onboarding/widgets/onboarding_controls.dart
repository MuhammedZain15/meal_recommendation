import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';

class NavigationRow extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController pageController;
  final VoidCallback onLoginPressed;

  const NavigationRow({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage > 0)
            PreviousButton(pageController: pageController),
          PageIndicators(currentPage: currentPage, totalPages: totalPages),
          NavigationButton(
            currentPage: currentPage,
            totalPages: totalPages,
            pageController: pageController,
            onLoginPressed: onLoginPressed,
          ),
        ],
      ),
    );
  }
}

// ======== Page Indicators ========
class PageIndicators extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicators({
    required this.currentPage,
    required this.totalPages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalPages,
            (index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: Colors.black12,
              end: currentPage == index ? AppColors.kPrimary : Colors.black12,
            ),
            duration: const Duration(milliseconds: 500),
            builder: (context, color, child) {
              return Container(
                width: 25,
                height: 10,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ======== Navigation Button (Next & Login) ========
class NavigationButton extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController pageController;
  final VoidCallback onLoginPressed;

  const NavigationButton({super.key,
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (currentPage < totalPages - 1) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.decelerate,
          );
        } else {
          onLoginPressed();
        }
      },
      child: Text(
        currentPage == totalPages - 1 ? "Login" : "Next",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: AppColors.kPrimary,
        ),
      ),
    );
  }
}

// ======== Previous Button ========
class PreviousButton extends StatelessWidget {
  final PageController pageController;

  const PreviousButton({
    required this.pageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        pageController.previousPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.decelerate,
        );
      },
      child: Text(
        "Previous",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: AppColors.kPrimary,
        ),
      ),
    );
  }
}
