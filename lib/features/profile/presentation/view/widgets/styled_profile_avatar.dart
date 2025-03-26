import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_colors.dart';

class StyledProfileAvatar extends StatelessWidget {
  const StyledProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kGrey,
          ),
        ),
        Positioned(
          top: 20,
          right: 0,
          left: 70,
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kPrimary,
              ),
              child: const Icon(
                FontAwesomeIcons.pen,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
