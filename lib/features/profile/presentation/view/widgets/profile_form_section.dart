import 'package:flutter/material.dart';

import 'styled_profile_text_field.dart';

class ProfileFormSection extends StatelessWidget {
  const ProfileFormSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 20,
        children: [
          StyledProfileTextField(controller: nameController),
          StyledProfileTextField(controller: emailController),
          StyledProfileTextField(controller: phoneController),
          StyledProfileTextField(controller: passwordController),
        ],
      ),
    );
  }
}
