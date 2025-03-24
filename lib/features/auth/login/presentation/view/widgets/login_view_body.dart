import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/custom_button.dart';
import 'package:meal_recommendation/core/components/custom_text_field.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import 'package:meal_recommendation/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:meal_recommendation/features/auth/login/presentation/view/widgets/social_methods.dart';
import '../../../../../../core/components/divider_with_text.dart';
import '../../../../../../core/components/remember_me_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool showPass = false;
  bool rememberMe = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passowordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passowordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            AppImages.background,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 34.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(AppImages.logo1),
                  Gap(70),
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
                  Gap(22),
                  CustomTextFormField(
                    controller: passowordController,
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
                  Gap(15),
                  RememberMeWidget(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = !rememberMe;
                      });
                    },
                  ),
                  Gap(48),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().login(
                          usernameController.text.trim(),
                          passowordController.text.trim(),
                        );
                      }
                    },
                  ),
                  Gap(24),
                  DividerWithText(text: 'login with'),
                  Gap(45),
                  SocialMethods(),
                  Gap(34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: AppStyles.font14W500WhiteColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.kRegisterView);
                        },
                        child: Text(
                          ' register now',
                          style: AppStyles.font14W600WhiteColor,
                        ),
                      ),
                    ],
                  ),
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginError) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      if (state is LoginLoaded) {
                        Navigator.pop(context);
                        context.pushNamed(AppRouter.kRecipeDetailsView);
                      }
                      if (state is LoginLoading) {
                        showDialog(
                          context: context,
                          builder:
                              (context) => Center(
                                child: const CircularProgressIndicator(),
                              ),
                        );
                      }
                    },
                    child: SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
