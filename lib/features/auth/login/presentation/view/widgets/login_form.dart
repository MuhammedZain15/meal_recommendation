import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:meal_recommendation/core/components/custom_button.dart';
import 'package:meal_recommendation/core/components/custom_text_field.dart';
import 'package:meal_recommendation/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:meal_recommendation/core/components/remember_me_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showPass = false;
  bool rememberMe = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: usernameController,
            hintText: 'username',
            icon: Icons.person_4_outlined,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter user name';
              }
              return null;
            },
          ),
          const Gap(22),
          CustomTextFormField(
            controller: passwordController,
            isPassword: true,
            hintText: 'password',
            icon: Icons.lock_outline_rounded,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
            isPasswordVisible: showPass,
            onTogglePasswordVisibility: () {
              setState(() {
                showPass = !showPass;
              });
            },
          ),
          const Gap(15),
          RememberMeWidget(
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = !rememberMe;
              });
            },
          ),
          const Gap(48),
          CustomButton(
            text: 'Login',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                  usernameController.text.trim(),
                  passwordController.text.trim(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
