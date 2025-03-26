import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';

import '../home/data/repo/recipe_initializer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Check if user is logged in
    final User? currentUser = FirebaseAuth.instance.currentUser;

    // If user is logged in, check if they have recipes and create defaults if needed
    if (currentUser != null) {
      try {
        print('User is logged in at splash screen: ${currentUser.uid}');
        await RecipeInitializer.initializeRecipesIfNeeded(
          FirebaseFirestore.instance,
        );
      } catch (e) {
        print('Error creating default recipes at splash: $e');
      }

      if (!mounted) return;
      context.go(AppRouter.kLayoutView); // Navigate to main app layout
    } else {
      if (!mounted) return;
      context.go(AppRouter.kOnboardingView); // Navigate to onboarding
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Image.asset(AppImages.logo, width: 200, height: 200),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
