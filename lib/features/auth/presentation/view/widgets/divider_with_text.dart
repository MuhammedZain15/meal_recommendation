import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.5))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
        // Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.5))),
      ],
    );
  }
}
