import 'package:flutter/material.dart';

import '../build_page_views.dart';
import 'onboarding_navigation.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: buildPageViews(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: OnboardingNavigation(
              currentPage: _currentPage,
              pageController: _pageController,
              totalPages: 4,
            ),
          ),
        ],
      ),
    );
  }
}
