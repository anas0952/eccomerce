import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/constant/color.dart';

class CardDeliveryTypeCheckOut extends StatelessWidget {
  final String imagename;
  final String title;
  final bool active;

  const CardDeliveryTypeCheckOut(
      {super.key,
      required this.imagename,
      required this.title,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 160,
          decoration:
              BoxDecoration(border: Border.all(color: Appcolor.primarycolor)),
          child: Column(children: [
            SizedBox(
                width: 130,
                height: 120,
                child: Lottie.asset(
                  imagename,
                  repeat: true,
                )),
            Text(
              title,
              style: TextStyle(
                  color: active == true
                      ? Appcolor.secouncolor
                      : Appcolor.primarycolor,
                  fontSize: 16,
                  fontWeight: active == true ? FontWeight.bold : null),
            )
          ]),
        ),
        Container(
          height: 160,
          width: 130,
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 53, 1, 62)),
              color: active == true
                  ? Appcolor.secouncolor.withOpacity(0.5)
                  : Appcolor.secouncolor.withOpacity(0)),
        )
      ],
    );
  }
}
