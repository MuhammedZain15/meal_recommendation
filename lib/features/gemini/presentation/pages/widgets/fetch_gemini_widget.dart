import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../home/presentation/view/widgets/recipe_card_item.dart';
import '../../bloc/recipe_bloc.dart';

class FetchGeminiWidget extends StatelessWidget {
  const FetchGeminiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is RecipeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecipeLoaded) {
          return ListView.builder(
            padding: EdgeInsets.all(15.h),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

            itemCount: 1,
            itemBuilder: (context, index) {
              final recipe = state.recipe;
              return RecipeCardItem(
                recipe: recipe,
                onTap: () {
                  // Navigate to recipe details with recipe data
                  context.push(AppRouter.kRecipeDetailsView, extra: recipe);
                },
              );
            },
          );
        } else if (state is RecipeError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const Center(child: Text("Search for a recipe"));
      },
    );
  }
}
