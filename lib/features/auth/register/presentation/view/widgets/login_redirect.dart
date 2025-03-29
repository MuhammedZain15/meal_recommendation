import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_styles.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.kDontHaveAccount,
          style: AppStyles.font14W500WhiteColor,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kLoginView);
          },
          child: Text(
            AppStrings.kLoginNow,
            style: AppStyles.font14W600WhiteColor,
          ),
        ),
      ],
    );
  }
}
