import 'package:flutter/material.dart';

import '../../core/utils/app_images.dart';
import 'widgets/onboarding_page_view.dart';

List<Widget> buildPageViews() {
  return [
    OnboardingPageView(
      title: "Personalized Meal Recommendations",
      description:
          "Get AI-driven meal suggestions tailored to your taste and dietary preferences.",
      image: AppImages.food1,
    ),
    OnboardingPageView(
      title: "AI-Powered Nutrition Guide",
      description:
          "Our smart AI analyzes your eating habits to provide healthier food choices.",

      image: AppImages.food2,
    ),
    OnboardingPageView(
      title: "Plan Your Meals Effortlessly",
      description:
          "Save time with automated meal planning based on your schedule and preferences.",

      image: AppImages.food1,
    ),
    OnboardingPageView(
      title: "Smart Grocery List Generator",
      description:
          "Generate a shopping list instantly based on your selected meals.",

      image: AppImages.food2,
    ),
  ];
}
