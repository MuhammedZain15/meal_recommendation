import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_images.dart';
import 'favorite/presentation/pages/favorite_view.dart';
import 'home/presentation/view/home_view.dart';
import 'profile/presentation/view/profile_view.dart';

class StyledBottomNavBar extends StatefulWidget {
  const StyledBottomNavBar({super.key});

  @override
  StyledBottomNavBarState createState() => StyledBottomNavBarState();
}

class StyledBottomNavBarState extends State<StyledBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const FavoriteView(),
    const ProfileView(),
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
          SvgPicture.asset(AppImages.home),
          const Icon(FontAwesomeIcons.heart),
          const Icon(FontAwesomeIcons.user),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}
