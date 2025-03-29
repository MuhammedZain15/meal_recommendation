import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/components/styled_app_bar.dart';
import '../../../../../core/components/styled_elevated_button.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../auth/shared/model/user_model.dart';
import '../../controller/bloc/profile_bloc.dart';
import 'profile_form_section.dart';
import 'styled_profile_avatar.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final SharedPreferences prefs;

  void inializesharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();

    if (!mounted) return;
    inializesharedPreferences();
    context.read<ProfileBloc>().add(GetProfileEvent());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: StyledAppBar(),
            ),
            const SizedBox(height: 12),

            const StyledProfileAvatar(),
            const SizedBox(height: 30),

            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is ProfileError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  _nameController.text = state.user.username;
                  _emailController.text = state.user.email;
                  _phoneController.text = state.user.phone;
                  _passwordController.text = state.user.password;

                  return ProfileFormSection(
                    nameController: _nameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    passwordController: _passwordController,
                  );
                }
                return ProfileFormSection(
                  nameController: _nameController,
                  emailController: _emailController,
                  phoneController: _phoneController,
                  passwordController: _passwordController,
                  isEnabled: false,
                );
              },
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: StyledElevatedButton(
                text: AppStrings.kSave,
                onPressed: () {
                  final updatedUser = UserModel(
                    uid: prefs.getString('userId') ?? '',
                    username: _nameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    password: _passwordController.text,
                  );

                  context.read<ProfileBloc>().add(
                    SaveProfileEvent(updatedUser),
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    if (!context.mounted) return;
                    context.read<ProfileBloc>().add(GetProfileEvent());
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
