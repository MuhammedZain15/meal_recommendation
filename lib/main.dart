import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_recommendation/features/auth/register/data/data_source/register_datasource.dart';
import 'package:meal_recommendation/features/auth/register/data/repository/register_repository_impl.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:meal_recommendation/core/helpers/firebase_init.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await firebaseInit();
  WakelockPlus.enable();
 await RegisterRepositoryImpl(
    remoteDataSource: RegisterRemoteDataSourceImpl(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
  ).signInWithFacebook();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      title: 'Meal Recommendation',
      routerConfig: AppRouter.router,
    );
  }
}
