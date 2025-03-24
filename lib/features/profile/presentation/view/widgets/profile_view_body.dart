import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/components/styled_app_bar.dart';
import 'package:meal_recommendation/core/utils/app_strings.dart';

import '../../../../../core/components/styled_elevated_button.dart';
import 'profile_form_section.dart';
import 'styled_profile_avatar.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'John Doe');
    _emailController = TextEditingController(text: 'John Doe');
    _phoneController = TextEditingController(text: 'John Doe');
    _passwordController = TextEditingController(text: 'John Doe');
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
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: StyledAppBar(),
          ),
          const SizedBox(height: 12),

          const StyledProfileAvatar(),
          const SizedBox(height: 30),
          ProfileFormSection(
            nameController: _nameController,
            emailController: _emailController,
            phoneController: _phoneController,
            passwordController: _passwordController,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: StyledElevatedButton(
              text: AppStrings.kSave,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
