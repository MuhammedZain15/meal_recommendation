import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/components/styled_app_bar.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_details_tab_bar_item.dart';

class RecipeDetailsViewBody extends StatelessWidget {
  const RecipeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: StyledAppBar(
              onLeadingTap: () => context.pop(),
              leadingIcon: Icons.arrow_back_ios_new_outlined,
              suffixIcon: Icons.favorite_border_rounded,
            ),
          ),
          const Gap(10),
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
          const Gap(10),
          // Recipe Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('Shawarma', style: AppStyles.font23BoldBlackColor),
          ),
          const Gap(5),
          // Recipe Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'meat .  ',
                      style: AppStyles.font15Ww500DarkGreyColor),
                  TextSpan(
                      text: '14min . ',
                      style: AppStyles.font15Ww500DarkGreyColor),
                  TextSpan(
                      text: '1 serving',
                      style: AppStyles.font15Ww500DarkGreyColor),
                ],
              ),
            ),
          ),
          const Gap(20),
          // Ensure RecipeDetailsTabBarItem has a fixed height to prevent infinite height issues
          SizedBox(
            height: 600, // Adjust height as needed
            child: RecipeDetailsTabBarItem(),
          ),
        ],
      ),
    );
  }
}
