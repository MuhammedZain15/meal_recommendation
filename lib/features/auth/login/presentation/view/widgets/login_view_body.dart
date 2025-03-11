import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/custom_button.dart';
import 'package:meal_recommendation/core/components/custom_text_field.dart';

import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';

import '../../../../../../core/components/divider_with_text.dart';
import '../../../../../../core/components/remember_me_widget.dart';



class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            AppImages.background,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.fill,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 34.h),
            child: Column(
              children: [
                Image.asset(AppImages.logo1),
                Gap(70.h),
                CustomTextFormField(
                  label: 'username',
                  icon: Icons.person_4_outlined,
                ),
                Gap(22.h),
                CustomTextFormField(
                  isPassword: true,
                  label: 'password',
                  icon: Icons.lock_outline_rounded,
                ),
                Gap(15.h),
                RememberMeWidget(value: false, onChanged: (value) {}),
                Gap(48.h),
                CustomButton(text: 'Login', onPressed: () {}),
                Gap(24.h),
                DividerWithText(text: 'Or login with'),
                Gap(45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 33.r,
                      backgroundColor: AppColors.kSecondary,
                      child: Image.asset(AppImages.facebook),
                    ),
                    SizedBox(width: 53.w),
                    CircleAvatar(
                      radius: 33.r,
                      child: Image.asset(AppImages.google),
                    ),
                  ],
                ),
                Gap(34.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: AppStyles.font14W500WhiteColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRouter.kRegisterView);
                      },
                      child: Text(
                        ' register now',
                        style: AppStyles.font14W600WhiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
