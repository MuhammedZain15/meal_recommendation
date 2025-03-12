import 'package:flutter/material.dart';

import '../Onboarding_page_model.dart';

class OnboardingImage extends StatelessWidget {
  final PageController pageController;
  final List<OnboardingPageModel> onboardingContents;
  final double height;
  final double width;
  final int currentPage;
  final Function(int) onPageChanged;

  const OnboardingImage({super.key,
    required this.pageController,
    required this.onboardingContents,
    required this.height,
    required this.width,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.30,
      left: width * 0.5 - 125,
      child: SizedBox(
        height: 250,
        width: 250,
        child: PageView.builder(
          controller: pageController,
          itemCount: onboardingContents.length,
          onPageChanged: onPageChanged,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 125,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  onboardingContents[index].imagePath,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}