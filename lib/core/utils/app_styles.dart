import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle get font11W500WhiteColor => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle get font12W500WhiteColor => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle get font12W500PrimartColor => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimary,
  );
  static TextStyle get font12W500DarkGreyColor => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kDarkGrey,
  );
  static TextStyle get font13W700PrimaryColor => TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );

  static TextStyle get font14W500WhiteColor => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle get font14W600WhiteColor => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get font14W700PrimaryColor => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );
  static TextStyle get font15Ww500PrimaryColor => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimary,
  );
  static TextStyle get font15Ww500DarkGreyColor => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kDarkGrey,
  );
  static TextStyle get font16WBoldBlackColor => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlack,
  );

  static TextStyle get font18W400WhiteColor => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle get font18BoldPrimaryColor => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kPrimary,
  );
  static TextStyle get font18BoldBlackColor => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlack,
  );
  static TextStyle get font20BoldBlackColor => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlack,
  );

  static TextStyle get font21W700PrimaryColor => TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );
  static TextStyle get font22W700WhiteColor => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle get font23BoldBlackColor => TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlack,
  );
}
