import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

//Text
class CoustomButtonLocation extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CoustomButtonLocation({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: MaterialButton(
        minWidth: 100,
        padding: const EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        color: Appcolor.primarycolor,
        textColor: Colors.white,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
