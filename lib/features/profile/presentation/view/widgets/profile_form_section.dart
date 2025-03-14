import 'package:flutter/material.dart';

import 'styled_profile_text_field.dart';

class ProfileFormSection extends StatelessWidget {
  const ProfileFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 20,
        children: [
          StyledProfileTextField(),
          StyledProfileTextField(),
          StyledProfileTextField(),
          StyledProfileTextField(),
        ],
      ),
    );
  }
}

