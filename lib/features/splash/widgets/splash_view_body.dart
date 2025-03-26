import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_styles.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        GoRouter.of(context).pushReplacement(AppRouter.kOnboardingView);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BounceInUp(
              animate: true,
              child: Image.asset(
                AppImages.logo,
                width: screenWidth * 0.5,
                height: screenHeight * 0.5,
              ),
            ),
          ),
          BounceInDown(
            animate: true,
            child: Text(
              "Meal Recommendation",
              style: AppStyles.font18W400WhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
