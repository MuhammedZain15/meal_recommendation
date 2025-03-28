import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../features/home/presentation/logic/recipe_cubit.dart';

class IsFavoriteWidget extends StatefulWidget {
  const IsFavoriteWidget({
    super.key,
    required this.isFavorite,
    required this.recipeId,
  });

  final bool isFavorite;
  final String recipeId;

  @override
  State<IsFavoriteWidget> createState() => _IsFavoriteWidgetState();
}

class _IsFavoriteWidgetState extends State<IsFavoriteWidget> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  void didUpdateWidget(IsFavoriteWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update local state if props change
    if (oldWidget.isFavorite != widget.isFavorite) {
      setState(() {
        isFavorite = widget.isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Icon(
          isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
          key: ValueKey<bool>(isFavorite),
          color: isFavorite ? Colors.red : null,
        ),
      ),
      onPressed: () {
        // First update UI state immediately (optimistic update)
        setState(() {
          isFavorite = !isFavorite;
        });

        // Then update in database through Cubit
        context.read<RecipeCubit>().toggleFavorite(widget.recipeId, isFavorite);
      },
    );
  }
}
