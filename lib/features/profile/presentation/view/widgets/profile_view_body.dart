import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/components/styled_app_bar.dart';

import 'styled_profile_avatar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StyledAppBar(),
        SizedBox(height: 12),

        StyledProfileAvatar(),
      ],
    );
  }
}

