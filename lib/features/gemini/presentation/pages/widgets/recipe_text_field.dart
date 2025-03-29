import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeTextField extends StatelessWidget {
  const RecipeTextField({super.key, required TextEditingController controller})
    : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Enter dish name...",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
