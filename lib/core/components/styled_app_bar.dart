import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StyledAppBar extends StatelessWidget {
  const StyledAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.bars)),
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.solidBell)),
        ],
      ),
    );
  }
}
