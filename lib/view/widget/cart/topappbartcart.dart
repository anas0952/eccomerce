import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

class TopAppBarCart extends StatelessWidget {
  final String message;
  const TopAppBarCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Appcolor.colorsHometow,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color(0xffE1ECC8),
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ),
    );
  }
}
