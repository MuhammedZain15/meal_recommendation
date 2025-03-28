import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'summary_tab.dart';

class RecipeDetailsTabBarItem extends StatelessWidget {
  const RecipeDetailsTabBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab Bar (Fixed)
          TabBar(
            labelColor: AppColors.kPrimary,
            unselectedLabelColor: Colors.grey,
            labelStyle: AppStyles.font20BoldBlackColor.copyWith(
              color: AppColors.kPrimary,
              fontWeight: FontWeight.w400,
            ),
            indicator: UnderlineTabIndicator(
              insets: const EdgeInsets.symmetric(horizontal: 30.0),
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                width: 5.0,
                color: AppColors.kPrimary,
              ),
            ),
            indicatorWeight: 5,
            dividerColor: Colors.transparent,
            indicatorColor: AppColors.kPrimary,
            tabs: const [
              Tab(text: "Summary"),
              Tab(text: "Ingredients"),
              Tab(text: "Direction"),
            ],
          ),

          // Tab Content (Flexible & Scrollable)
          const Expanded(
            child: TabBarView(
              children: [
                SummaryTab(), // Already scrollable inside
                Center(child: Text("Ingredients Section")),
                Center(child: Text("Directions Section")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
