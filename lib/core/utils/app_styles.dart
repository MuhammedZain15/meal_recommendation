import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  // font size 11
  static TextStyle font11W500WhiteColor = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // font size 12
  static TextStyle font12W500WhiteColor = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  // font size 13
  static TextStyle font13W700PrimaryColor = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );

  // font size 14

  static TextStyle font14W500WhiteColor = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle textStyle13(BuildContext context) => TextStyle(
        fontSize: 13.sp,
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      );

  static TextStyle font14W600WhiteColor = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle font14W700PrimaryColor = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );

  // font size 18
  static TextStyle font18W400WhiteColor = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  // font size 21
  static TextStyle font21W700PrimaryColor = GoogleFonts.inter(
    fontSize: 21,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimary,
  );

  static TextStyle textStyle30(BuildContext context) => TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
  static TextStyle textStyle40(BuildContext context) => TextStyle(
        fontSize: 40.sp,
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      );
}
