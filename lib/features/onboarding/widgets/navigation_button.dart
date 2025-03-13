import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        isNext
            ? (currentPage == totalPages - 1 ? "Login" : "Next")
            : (currentPage > 0 ? "Prev" : "Skip"),
      ),
    );
  }
}
