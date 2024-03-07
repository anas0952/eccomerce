import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

class CoustomTitleHome extends StatelessWidget {
  final String title;
  const CoustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 21, color: Appcolor.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
