import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';

class SocialMethods extends StatelessWidget {
  const SocialMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 33.r,
          backgroundColor: AppColors.kSecondary,
          child: Image.asset(AppImages.facebook),
        ),
        SizedBox(width: 53.w),
        CircleAvatar(radius: 33.r, child: Image.asset(AppImages.google)),
      ],
    );
  }
}
