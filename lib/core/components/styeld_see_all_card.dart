import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';

class StyeldSeeAllCard extends StatelessWidget {
   const StyeldSeeAllCard({super.key,required this.title,required this.imageUrl,required this.time,required this.ingredients,required this.onTap});
   
   final String title;
   final String imageUrl;
    final String time;
    final int ingredients; 
    final Function()? onTap;
     @override
  Widget build(BuildContext context) {
    return 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InkWell(
            onTap: onTap,
            child: Card(
              color: AppColors.kGrey,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border,color: AppColors.kPrimary,),
                    ),
                  ),
                  Column(
                  spacing: 5,
                  children: [
                    Image.asset(imageUrl, width: double.infinity),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppStyles.font20BoldBlackColor),
                          Row(
                            children: [
                              Text(
                                ingredients.toString(),
                                style: AppStyles.font15Ww500DarkGreyColor,
                              ),
                              Text(
                                time,
                                style: AppStyles.font15Ww500DarkGreyColor,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        );
  }
}