import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/components/custom_button.dart';
import '../../../../../../core/components/custom_text_field.dart';
import '../../../../../../core/components/remember_me_widget.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../controller/register_bloc.dart';
import '../../controller/register_event.dart';
import '../../controller/register_states.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _phoneController;
  late final TextEditingController _usernameController;
  final _formKey = GlobalKey<FormState>();
  bool value = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppStrings.kUsername,
            icon: Icons.person_4_outlined,
            controller: _usernameController,
          ),
          Gap(22.h),
          CustomTextFormField(
            hintText: AppStrings.kEmail,
            icon: Icons.person_4_outlined,
            controller: _emailController,
          ),
          Gap(22.h),
          CustomTextFormField(
            hintText: AppStrings.kPhone,
            icon: Icons.person_4_outlined,
            controller: _phoneController,
          ),
          Gap(22.h),
          CustomTextFormField(
            isPassword: true,
            hintText: AppStrings.kPassword,
            icon: Icons.lock_outline_rounded,
            controller: _passwordController,
          ),
          Gap(15.h),
          RememberMeWidget(
            value: value,
            onChanged: (val) {
              setState(() {
                value = val!;
              });
            },
          ),
          Gap(48.h),
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registration Successful')),
                );
                GoRouter.of(context).go(AppRouter.kLoginView);
              }
            },
            builder: (context, state) {
              if (state is RegisterLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return CustomButton(
                text: AppStrings.kRegister,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (value) {
                      context.read<RegisterBloc>().add(
                        SignUpWithEmailEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                          username: _usernameController.text,
                          phone: _phoneController.text,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please check the remember me box'),
                        ),
                      );
                    }
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}