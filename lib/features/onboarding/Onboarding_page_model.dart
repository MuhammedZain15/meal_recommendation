import 'package:meal_recommendation/core/utils/app_images.dart';

class OnboardingPageModel {
  final String imagePath;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(
    imagePath: AppImages.food1,
    title: "Personalized Meal Recommendations",
    description:
        "Get AI-driven meal suggestions tailored to your taste and dietary preferences.",
  ),
  OnboardingPageModel(
    imagePath: AppImages.food2,
    title: "AI-Powered Nutrition Guide",
    description:
        "Our smart AI analyzes your eating habits to provide healthier food choices.",
  ),
  OnboardingPageModel(
    imagePath: AppImages.food1,
    title: "Plan Your Meals Effortlessly",
    description:
        "Save time with automated meal planning based on your schedule and preferences.",
  ),
  OnboardingPageModel(
    imagePath: AppImages.food2,
    title: "Smart Grocery List Generator",
    description:
        "Generate a shopping list instantly based on your selected meals.",
  ),
];
