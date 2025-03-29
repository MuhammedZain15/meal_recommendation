import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meal_recommendation/core/utils/app_styles.dart';

import 'build_widgets/fetch_recommended_widget.dart';
import 'build_widgets/fetch_trending_widget.dart';

class SeeAllViewBody extends StatelessWidget {
  const SeeAllViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          // Trending Recipes Title
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
            child: Text(
              "Trending Recipes",
              style: AppStyles.font21W700PrimaryColor,
            ),
          ),

          // Trending Recipes Horizontal List
          SizedBox(height: 220.h, child: const FetchTrendingWidget()),

          SizedBox(height: 30.h),

          // Recommended Recipes Title
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
            child: Text(
              "Recommended for you",
              style: AppStyles.font21W700PrimaryColor,
            ),
          ),

          // Recommended Recipes Vertical List
          const FetchRecommendedWidget(),
        ],
      ),
    );
  }
}
