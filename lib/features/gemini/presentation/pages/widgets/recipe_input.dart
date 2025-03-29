import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/recipe_bloc.dart';

class RecipeButton extends StatelessWidget {
  const RecipeButton({
    super.key,
    required this.userId,
    required TextEditingController controller,
  }) : _controller = controller;

  final String? userId;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:
          userId == null
              ? null
              : () {
                if (_controller.text.isNotEmpty) {
                  context.read<RecipeBloc>().add(
                    FetchRecipeEvent(userId!, _controller.text),
                  );
                  _controller.clear();
                }
              },
      child: const Icon(Icons.send),
    );
  }
}
