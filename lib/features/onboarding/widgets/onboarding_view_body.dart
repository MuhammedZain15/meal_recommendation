import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';

import '../Onboarding_page_model.dart';
import 'onboarding_controls.dart';
import 'onboarding_page.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingViewBody> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.kPrimary),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == onboardingPages.length - 1;
                  });
                },
                children:
                    onboardingPages
                        .map((page) => OnboardingPage(page: page))
                        .toList(),
              ),
            ),
            OnboardingControls(controller: _controller, isLastPage: isLastPage),
          ],
        ),
      ),
    );
  }
}
