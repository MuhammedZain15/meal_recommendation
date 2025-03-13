import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_recommendation/core/helpers/firebase_init.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInit();
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

      title: 'Meal Recommendation',
      routerConfig: AppRouter.router,
    );
  }
}
