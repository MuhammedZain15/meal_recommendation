import 'package:flutter/material.dart';

class StyledProfileTextField extends StatelessWidget {
  const StyledProfileTextField({
    super.key,
    required this.controller,
    this.obsecureText = false,
    this.isEnabled = true,
  });

  final TextEditingController controller;
  final bool obsecureText;
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isEnabled,
      obscureText: obsecureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      controller: controller,
    );
  }
}
