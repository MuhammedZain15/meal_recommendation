import 'package:flutter/material.dart';

class StyledProfileTextField extends StatelessWidget {
  const StyledProfileTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      controller: TextEditingController(text: 'Initial Text'),
    );
  }
}
