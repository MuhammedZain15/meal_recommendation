import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import '../Onboarding_page_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.logo,
          width: screenWidth * 0.3,
          height: screenHeight * 0.2,
        ),
        SizedBox(height: screenHeight * 0.07),
        ClipOval(
          child: Image.asset(
            page.imagePath,
            width: screenWidth * 0.6,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          page.title,
          style: AppStyles.font18W400WhiteColor,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            page.description,
            style: AppStyles.font11W500WhiteColor,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
