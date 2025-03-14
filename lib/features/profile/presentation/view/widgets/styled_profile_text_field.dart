import 'package:flutter/material.dart';

class StyledProfileTextField extends StatelessWidget {
  const StyledProfileTextField({
    super.key,
    required this.controller,
    this.obsecureText = false,
  });

  final TextEditingController controller;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      controller: controller,
    );
  }
}
