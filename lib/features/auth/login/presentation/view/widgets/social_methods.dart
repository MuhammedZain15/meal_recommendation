import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';

class SocialMethods extends StatelessWidget {
  const SocialMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 33.r, child: Image.asset(AppImages.facebook)),
        SizedBox(width: 53.w),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoaded) {
              context.pushNamed(AppRouter.kDetailsView);
            } else if (state is LoginError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else {
              showDialog(
                context: context,
                builder:
                    (context) =>
                        Center(child: const CircularProgressIndicator()),
              );
            }
          },
          child: InkWell(
            onTap: () {
              context.read<LoginCubit>().loginWithGoogle();
            },
            child: CircleAvatar(
              radius: 33.r,
              child: Image.asset(AppImages.google),
            ),
          ),
        ),
      ],
    );
  }
}
