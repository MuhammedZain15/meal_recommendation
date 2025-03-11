import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/utils/app_router.dart';
import '../Onboarding_page_model.dart';

class OnboardingControls extends StatelessWidget {
  final PageController controller;
  final bool isLastPage;

  const OnboardingControls({
    super.key,
    required this.controller,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: controller,
            count: onboardingPages.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.blue,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
           SizedBox(height: screenHeight * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed:
                    () => controller.jumpToPage(onboardingPages.length - 1),
                child: const Text("Skip"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (isLastPage) {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(isLastPage ? "Login" : "Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
