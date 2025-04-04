import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/error/failure.dart';
import 'core/helpers/firebase_init.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_router.dart';
import 'features/home/data/repo/recipe_initializer.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await firebaseInit();

  // Initialize service locator
  serviceLocator();

  // Check if user is logged in
  final User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    // User is logged in, initialize recipes
    try {
      await RecipeInitializer.initializeRecipesIfNeeded(
        FirebaseFirestore.instance,
      );
    } catch (e) {
      throw Failure(e.toString());
    }
  } else {}

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
        title: 'Meal Recommendation',
        routerConfig: AppRouter.router,
      ),
    );
  }
}
