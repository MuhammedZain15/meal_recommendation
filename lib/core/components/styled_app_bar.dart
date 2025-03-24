import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';

class StyledAppBar extends StatelessWidget {
  const StyledAppBar({
    super.key,
    this.leadingIcon,
    this.suffixIcon,
    this.onLeadingTap,
    this.onSuffixTap,
  });

  final IconData? leadingIcon;
  final IconData? suffixIcon;
  final void Function()? onLeadingTap;
  final void Function()? onSuffixTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // زر الـ leading
        IconButton(
          onPressed: onLeadingTap ?? () {},
          icon: Icon(
            leadingIcon ?? FontAwesomeIcons.bars,
            color: AppColors.kPrimary,
          ),
        ),

        // زر الـ suffix
        IconButton(
          onPressed: onSuffixTap ?? () {},
          icon: Icon(
            suffixIcon ?? FontAwesomeIcons.solidBell,
            color: AppColors.kPrimary,
          ),
        ),
      ],
    );
  }
}
