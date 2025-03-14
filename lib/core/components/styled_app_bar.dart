import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';

class StyledAppBar extends StatelessWidget {
  const StyledAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.bars, color: AppColors.kPrimary),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.solidBell, color: AppColors.kPrimary),
        ),
      ],
    );
  }
}
