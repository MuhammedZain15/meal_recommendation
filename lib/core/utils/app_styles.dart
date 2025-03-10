
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


abstract class AppStyles {
  static TextStyle textStyle13(BuildContext context) => TextStyle(
        fontSize: 13.sp        ,       color: Colors.grey[600],
        fontWeight: FontWeight.bold,
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
