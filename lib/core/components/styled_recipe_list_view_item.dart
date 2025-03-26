import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_strings.dart';
import '../utils/app_styles.dart';

class StyledRecipeListViewItem extends StatelessWidget {
  const StyledRecipeListViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.ingredientsCount,
    required this.time,
    required this.isTrending,
    this.onTap,
  });

  final String image;
  final String title;
  final int ingredientsCount;
  final int time;
  final bool isTrending;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isTrending ? 100 : 130,
            width: isTrending ? 220.w : 280.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style:
                isTrending
                    ? AppStyles.font16WBoldBlackColor
                    : AppStyles.font23BoldBlackColor,
          ),
          Row(
            spacing: 10,
            children: [
              Text(
                '$ingredientsCount ${AppStrings.kIngredients}',
                style:
                    isTrending
                        ? AppStyles.font12W500DarkGreyColor
                        : AppStyles.font15Ww500DarkGreyColor,
              ),
              Text(
                '$time${AppStrings.kMin}',
                style:
                    isTrending
                        ? AppStyles.font12W500PrimartColor
                        : AppStyles.font15Ww500PrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
