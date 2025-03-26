import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/helpers/firebase_init.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInit();
  serviceLocator();

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
