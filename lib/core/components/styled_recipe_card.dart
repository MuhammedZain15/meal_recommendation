import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_strings.dart';
import '../utils/app_styles.dart';
import 'is_favorite_widget.dart';

class StyledRecipeCard extends StatelessWidget {
  const StyledRecipeCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.ingredientsCount,
    required this.time,
    required this.rating,
    required this.isFavorite,
    required this.recipeId,
    this.onTap,
  });

  final String image;
  final String title;
  final String subtitle;
  final int ingredientsCount;
  final int time;
  final int rating;
  final bool isFavorite;
  final String recipeId;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 140.h,
        child: Stack(
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    child: Image.network(image),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppStyles.font15Ww500PrimaryColor),
                          Text(subtitle, style: AppStyles.font20BoldBlackColor),

                          Row(
                            children: [
                              Text(
                                '$ingredientsCount ${AppStrings.kIngredients}',
                                style: AppStyles.font15Ww500DarkGreyColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '$time${AppStrings.kMin}',
                                style: AppStyles.font15Ww500PrimaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: List.generate(rating, (index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IsFavoriteWidget(
                isFavorite: isFavorite,
                recipeId: recipeId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
