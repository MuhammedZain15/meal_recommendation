import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/styled_app_bar.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';

class RecipeDetailsViewBody extends StatelessWidget {
  const RecipeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: StyledAppBar(
            onLeadingTap: () => context.pop(),
            leadingIcon: Icons.arrow_back_ios_new_outlined,
            suffixIcon: Icons.favorite_border_rounded,
          ),
        ),
        Gap(10),
        // Recipe Image
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.food3),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Gap(10),
        // Recipe Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text('Shawrma', style: AppStyles.font23BoldBlackColor),
        ),
        Gap(5),
        // Recipe Subtitle
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'meat .  ', style: AppStyles.font15Ww500DarkGreyColor),
              TextSpan(
                  text: '14min . ', style: AppStyles.font15Ww500DarkGreyColor),
              TextSpan(
                  text: '1 serving', style: AppStyles.font15Ww500DarkGreyColor),
            ],
          ),
        ),
      ],
    );
  }
}
