import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';
import 'package:meal_recommendation/features/home/presentation/view/widgets/recipe_details_tab_bar_item.dart';

import '../../../../../core/components/styled_app_bar.dart';
import '../../../../../core/utils/app_images.dart';

class RecipeDetailsViewBody extends StatelessWidget {
  const RecipeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App Bar
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: StyledAppBar(
              onLeadingTap: () => context.pop(),
              leadingIcon: Icons.arrow_back_ios_new_outlined,
              suffixIcon: Icons.favorite_border_rounded,
            ),
          ),
        ),
        const SliverGap(10),

        // Recipe Image
        SliverToBoxAdapter(
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.food3),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SliverGap(10),

        // Recipe Title
        SliverToBoxAdapter(
          child: Column(
            children: [
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
            ],
          ),
        ),

        // Recipe Details Tab Bar & Content
        SliverFillRemaining(
          hasScrollBody: true, // Allows scrolling within Tab content
          child: RecipeDetailsTabBarItem(),
        ),
      ],
    );
  }
}
