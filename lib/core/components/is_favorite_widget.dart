import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IsFavoriteWidget extends StatefulWidget {
  const IsFavoriteWidget({super.key, required this.isFavorite});

  final bool isFavorite;
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
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;

          // Add your logic here
          //add the logic to add or remove the recipe from the favorite list in firestore 
        });
        if(isFavorite ==true){
          //add the recipe to the favorite list in firestore
        }
        else{
          //remove the recipe from the favorite list in firestore
        }
      },
    );
  }
}
