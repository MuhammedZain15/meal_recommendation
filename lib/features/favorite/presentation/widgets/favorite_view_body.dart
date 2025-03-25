import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_recommendation/core/components/styled_app_bar.dart';
import 'package:meal_recommendation/core/components/styled_recipe_card.dart';
import 'package:meal_recommendation/core/services/service_locator.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/features/favorite/presentation/controller/favorites_bloc.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(sl())..fetchFavorites(),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 20.0.h, left: 10.w, right: 10.w),
                child: Column(
                  children: [
                    SizedBox(height: 60.h, child: const StyledAppBar()),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 10),
                        itemCount: 5,
                        itemBuilder:
                            (context, index) => StyledRecipeCard(
                              title: "title",
                              subtitle: "subtitle",
                              image: AppImages.food2,
                              rating: 5,
                              ingredientsCount: 3,
                              isFavorite: true,
                              time: 15,
                              onTap: () {},
                            ),
                      ),
                      //FetchFavoritesWidget(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
