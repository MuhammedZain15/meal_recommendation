import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/components/custom_button.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/features/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimary,
        body: CustomButton(
          text: 'Login',
          onPressed: () {},
          backgroundColor: Color(0xFF0D1529),
          borderRadius: 14,
        ));
  }
}
