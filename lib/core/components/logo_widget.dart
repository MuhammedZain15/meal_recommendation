import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final Widget widget;

  const LogoWidget({super.key, this.size = 120, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(child: widget),
    );
  }
}
