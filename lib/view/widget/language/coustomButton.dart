import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CoustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CoustomButtonLang(
      {super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: MaterialButton(
        color: Appcolor.buttoncolor,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
