import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/custom_button.dart';
import 'package:meal_recommendation/core/components/custom_text_field.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_router.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import 'package:meal_recommendation/features/auth/login/presentation/view/widgets/social_methods.dart';
import '../../../../../../core/components/divider_with_text.dart';
import '../../../../../../core/components/remember_me_widget.dart';
import '../../controller/bloc/login_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool showPass = false;
  bool rememberMe = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passowordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
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
                    controller: emailController,
                    hintText: AppStrings.kEmail,
                    icon: Icons.person_4_outlined,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  Gap(22),
                  CustomTextFormField(
                    controller: passowordController,
                    isPassword: true,
                    hintText: AppStrings.kPassword,
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
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.go(AppRouter.kProfileView);
                      }
                      if (state is LoginError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return CustomButton(
                        text: AppStrings.kLogin,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                              LoginWithEmailEvent(
                                email: emailController.text,
                                password: passowordController.text,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  Gap(24),
                  DividerWithText(text: AppStrings.kLogin),
                  Gap(45),
                  SocialMethods(),
                  Gap(34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.kDontHaveAccount,
                        style: AppStyles.font14W500WhiteColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.kRegisterView);
                        },
                        child: Text(
                          AppStrings.kRegisterNow,
                          style: AppStyles.font14W600WhiteColor,
                        ),
                      ),
                    ],
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
