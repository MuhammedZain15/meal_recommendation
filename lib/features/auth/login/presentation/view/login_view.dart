import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
