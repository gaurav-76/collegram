// Top navbar

// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        // Notification icon
        Icon(
          CupertinoIcons.bell_circle_fill,
          color: Colors.black,
          size: 47.0,
          //semanticLabel: 'Text to announce in accessibility modes',
        ),

        // Logo image
        // Icon(
        //   CupertinoIcons.bell_fill,
        //   color: Colors.green,
        //   size: 47.0,
        // ),

        // Chat icon
        Icon(
          CupertinoIcons.chat_bubble_text_fill,
          color: Colors.black,
          size: 45.0,
        ),
      ],
    );
  }
}
