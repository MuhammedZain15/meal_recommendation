import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
        if (state is LoginLoaded) {
          Navigator.pop(context);
          context.pushReplacementNamed(AppRouter.kNavBarView);
        }
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder:
                (context) => const Center(child: CircularProgressIndicator()),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
