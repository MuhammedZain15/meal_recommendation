import 'package:flutter/material.dart';

class OnboardingDot extends StatelessWidget {
  final bool isActive;

  const OnboardingDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 30,
      decoration: BoxDecoration(
        color: isActive ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

