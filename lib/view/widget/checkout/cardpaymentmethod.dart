import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color:
              isActive == true ? Appcolor.primarycolor : Appcolor.ciclercolor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            color: isActive == true ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            height: 1,
            fontSize: 18),
      ),
    );
  }
}
