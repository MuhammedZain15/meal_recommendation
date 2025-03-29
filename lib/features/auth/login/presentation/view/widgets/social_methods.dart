import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../manager/login_cubit/login_cubit.dart';

class SocialMethods extends StatelessWidget {
  const SocialMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 33.r, child: Image.asset(AppImages.facebook)),
        SizedBox(width: 53.w),
        InkWell(
          onTap: () {
            context.read<LoginCubit>().loginWithGoogle();
          },
          child: CircleAvatar(
            radius: 33.r,
            child: Image.asset(AppImages.google),
          ),
        ),
      ],
    );
  }
}
