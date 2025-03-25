import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/features/auth/register/presentation/view/widgets/login_redirect.dart';
import 'package:meal_recommendation/features/auth/register/presentation/view/widgets/register_form.dart';
import 'package:meal_recommendation/features/auth/register/presentation/view/widgets/social_login_button.dart';

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
                const RegisterForm(),
                Gap(24.h),
                const SocialLoginButtons(),
                Gap(34.h),
                const LoginRedirect(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
