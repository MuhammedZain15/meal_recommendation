import 'package:flutter/material.dart';
import 'package:meal_recommendation/core/components/styeld_see_all_card.dart';
import 'package:meal_recommendation/core/components/styled_app_bar.dart';
import 'package:meal_recommendation/core/components/styled_recipe_list_view_item.dart';
import 'package:meal_recommendation/core/utils/app_styles.dart';

class SeeAllViewBody extends StatelessWidget {
  const SeeAllViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: StyledAppBar()),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Trending Recipes",
                  style: AppStyles.font18BoldBlackColor,
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return StyledRecipeListViewItem(
                    image: "assets/images/food4.png",
                    ingredientsCount: 5,
                    isTrending: false,
                    time: 5,
                    title: "title",
                    onTap: () {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
              ),
            ),
          ),
      
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Recommended for you",
                  style: AppStyles.font18BoldBlackColor,
                ),
              ),
            ],
          ),
           Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return StyeldSeeAllCard(
                    imageUrl: "assets/images/food4.png",
                    ingredients: 5,
                    time: "5 min",
                    title: "title",
                    onTap: () {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
