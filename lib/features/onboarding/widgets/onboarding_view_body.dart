import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import '../../../core/utils/app_colors.dart';
import '../Onboarding_page_model.dart';
import 'onboarding_controls.dart';
import 'onboarding_image.dart';
import 'onboarding_page.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnboardingViewBody> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToLogin() {
    GoRouter.of(context).push(AppRouter.kLoginView);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background and Border Containers
          BackgroundColorStack(height: height, width: width),
          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Skip Button
                SkipButton(onPressed: _navigateToLogin),
                // Logo
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(AppImages.logo, height: height * 0.1),
                ),
                const Spacer(),
                OnboardingPage(
                  currentPage: _currentPage,
                  onboardingContents: onboardingPages,
                  height: height,
                ),
                // Navigation Row
                NavigationRow(
                  currentPage: _currentPage,
                  totalPages: onboardingPages.length,
                  pageController: _pageController,
                  onLoginPressed: _navigateToLogin,
                ),
              ],
            ),
          ),
          OnboardingImage(
            pageController: _pageController,
            onboardingContents: onboardingPages,
            height: height,
            width: width,
            currentPage: _currentPage,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

class BackgroundColorStack extends StatelessWidget {
  final double height;
  final double width;

  const BackgroundColorStack({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: height * 0.5,
            decoration: BoxDecoration(
              color: AppColors.kPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(width * 0.5),
                bottomRight: Radius.circular(width * 0.5),
              ),
            ),
          ),
        ),

        Positioned(
          top: height * 0.28,
          left: width * 0.5 - 155, // Centered
          child: Container(
            height: 310,
            width: 310,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: onPressed,
          child: Text('Skip', style: AppStyles.font14W600WhiteColor),
        ),
      ),
    );
  }
}
