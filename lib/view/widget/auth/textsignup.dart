import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CoustomTextsignUpoRsignIn extends StatelessWidget {
  final String textone;
  final String texttow;
  final void Function()? onTap;
  const CoustomTextsignUpoRsignIn(
      {super.key,
      required this.textone,
      required this.texttow,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            texttow,
            style: const TextStyle(
                color: Appcolor.primarycolor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
