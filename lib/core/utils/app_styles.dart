import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle font11W500WhiteColor = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle font12W500WhiteColor = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle font13W700PrimaryColor = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );

  static TextStyle font14W500WhiteColor = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle textStyle13(BuildContext context) => TextStyle(
    fontSize: 13.sp,
    color: Colors.grey[600],
    fontWeight: FontWeight.bold,
  );

  static TextStyle font14W600WhiteColor = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle font14W700PrimaryColor = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );

  static TextStyle font18W400WhiteColor = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font21W700PrimaryColor = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );
}
