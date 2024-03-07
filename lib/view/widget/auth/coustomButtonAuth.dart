import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

//Text
class CoustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CoustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        color: Appcolor.buttoncolor,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
