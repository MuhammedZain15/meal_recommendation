import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/remember_me_widget.dart';
import '../../../../../../core/components/custom_button.dart';
import '../../../../../../core/components/custom_text_field.dart';
import '../../../../../../core/components/divider_with_text.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_styles.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
                  hintText: 'Full name',
                  icon: Icons.person_4_outlined,
                ),
                Gap(22.h),
                CustomTextFormField(
                  hintText: 'Email Address',
                  icon: Icons.person_4_outlined,
                ),
                Gap(22.h),
                CustomTextFormField(
                  hintText: 'Phone',
                  icon: Icons.person_4_outlined,
                ),
                Gap(22.h),
                CustomTextFormField(
                  isPassword: true,
                  hintText: 'password',
                  icon: Icons.lock_outline_rounded,
                ),
                Gap(15.h),
                RememberMeWidget(value: false, onChanged: (value) {}),
                Gap(48.h),
                CustomButton(text: 'Register', onPressed: () {}),
                Gap(24.h),
                DividerWithText(text: 'Or login with'),
                Gap(45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 33.r,
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
                      'Do you have an account?',
                      style: AppStyles.font14W500WhiteColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRouter.kLoginView);
                      },
                      child: Text(
                        ' Login now',
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
