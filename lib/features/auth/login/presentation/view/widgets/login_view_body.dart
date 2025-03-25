import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/features/auth/login/presentation/view/widgets/login_bloc_listener.dart';
import 'package:meal_recommendation/features/auth/login/presentation/view/widgets/login_footer.dart';
import 'package:meal_recommendation/features/auth/login/presentation/view/widgets/login_form.dart';
import 'package:meal_recommendation/features/auth/login/presentation/view/widgets/social_methods.dart';
import 'package:meal_recommendation/core/components/divider_with_text.dart';

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
                const Gap(70),
                const LoginForm(),
                const Gap(24),
                const DividerWithText(text: 'login with'),
                const Gap(45),
                const SocialMethods(),
                const Gap(34),
                const LoginFooter(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
