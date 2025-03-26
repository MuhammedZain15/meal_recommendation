import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_styles.dart';

class OnboardingPageView extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPageView({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 350,
            decoration: const BoxDecoration(
              color: AppColors.kPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(AppImages.logo, scale: 1.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 220),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 110,
              ),
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 200),
              Container(
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
              ),
              const SizedBox(height: 13),
              Text(
                title,
                style: AppStyles.font18BoldPrimaryColor,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  description,
                  style: AppStyles.font13W700PrimaryColor,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
