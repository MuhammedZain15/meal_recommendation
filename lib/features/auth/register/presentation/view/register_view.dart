import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.kPrimary,
        body: RegisterViewBody());
  }
}
