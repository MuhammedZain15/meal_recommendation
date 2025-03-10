import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/features/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
