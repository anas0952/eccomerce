import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

class CoustomButtonAppBar extends StatelessWidget {
  final Function()? onPressed;
  final IconData iconButton;
  final bool active;
  const CoustomButtonAppBar(
      {super.key,
      required this.onPressed,
      required this.iconButton,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconButton,
            size: active == true ? 35 : 20,
            color:
                active == true ? Appcolor.colorshome : Appcolor.colorsHometow,
          ),
          // Text(
          //   textButtoon,
          //   style: TextStyle(
          //       color: active == true
          //           ? Appcolor.colorshome
          //           : Appcolor.colorsHometow),
          // )
        ],
      ),
    );
  }
}
