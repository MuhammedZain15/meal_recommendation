import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
