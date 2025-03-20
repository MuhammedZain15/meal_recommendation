import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';

import 'widgets/see_all_view_body.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kGrey,
        
        body: const SeeAllViewBody(),
      ),
    );
  }
}