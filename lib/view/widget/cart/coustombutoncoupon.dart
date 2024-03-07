import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CoustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CoustomButtonCoupon(
      {super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        color: Appcolor.primarycolor,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
