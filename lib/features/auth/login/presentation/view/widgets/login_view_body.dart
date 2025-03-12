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
import 'package:meal_recommendation/features/auth/login/presentation/view/widgets/social_methods.dart';

import '../../../../../../core/components/divider_with_text.dart';
import '../../../../../../core/components/remember_me_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool showPass = false;
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
                Gap(70),
                Column(
                  children: [
                    CustomTextFormField(
                      label: 'username',
                      icon: Icons.person_4_outlined,

                      validator: (value) {},
                    ),
                    Gap(22),
                    CustomTextFormField(
                      isPassword: true,

                      label: 'password',
                      icon: Icons.lock_outline_rounded,
                      isPasswordVisible: showPass,
                      onTogglePasswordVisibility: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                    ),
                  ],
                ),
                Gap(15),
                RememberMeWidget(value: false, onChanged: (value) {}),
                Gap(48),
                CustomButton(text: 'Login', onPressed: () {}),
                Gap(24),
                DividerWithText(text: 'Or login with'),
                Gap(45),
                SocialMethods(),
                Gap(34),
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
