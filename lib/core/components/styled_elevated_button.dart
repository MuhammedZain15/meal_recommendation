import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class StyledElevatedButton extends StatelessWidget {
  const StyledElevatedButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          backgroundColor: const WidgetStatePropertyAll(AppColors.kPrimary),
        ),
        child: Text(text, style: AppStyles.font22W700WhiteColor),
      ),
    );
  }
}
