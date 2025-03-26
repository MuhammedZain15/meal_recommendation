import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_recommendation/core/services/service_locator.dart';
import 'package:meal_recommendation/core/utils/app_colors.dart';
import 'package:meal_recommendation/core/utils/app_images.dart';
import 'package:meal_recommendation/features/favorite/presentation/controller/favorites_bloc.dart';
import 'package:meal_recommendation/features/favorite/presentation/pages/favorite_view.dart';
import 'package:meal_recommendation/features/home/presentation/view/home_view.dart';
import 'package:meal_recommendation/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:meal_recommendation/features/profile/presentation/view/profile_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    BlocProvider(
      create: (context) => FavoritesCubit(sl())..fetchFavorites(),
      child: const FavoriteView(),
    ),
    BlocProvider(
      create: (context) => ProfileBloc(getUser: sl(), updateUser: sl()),
      child: const ProfileView(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.kPrimary,
        index: _selectedIndex,
        animationCurve: Curves.linearToEaseOut,
        color: Colors.white,
        items: <Widget>[
          SvgPicture.asset(
            AppImages.home,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.kPrimary,
              BlendMode.srcIn,
            ),
          ),
          const Icon(FontAwesomeIcons.heart, color: AppColors.kPrimary),
          const Icon(FontAwesomeIcons.user, color: AppColors.kPrimary),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}
