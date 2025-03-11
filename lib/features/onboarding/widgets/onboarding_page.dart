import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import '../Onboarding_page_model.dart';

class OnboardingPage extends StatelessWidget {
  final int currentPage;
  final List<OnboardingPageModel> onboardingContents;
  final double height;

  const OnboardingPage({super.key,
    required this.currentPage,
    required this.onboardingContents,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              onboardingContents[currentPage].title,
              style: AppStyles.font21W700PrimaryColor.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.02),
            Text(
              onboardingContents[currentPage].description,
              style: AppStyles.font21W700PrimaryColor.copyWith(
                fontSize: 14,
                color: Colors.black87,
                letterSpacing: 0.5,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
