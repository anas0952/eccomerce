import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

class CardShppingAddressCheckOut extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;

  const CardShppingAddressCheckOut(
      {super.key,
      required this.title,
      required this.body,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color:
                isActive == true ? Appcolor.primarycolor : Appcolor.ciclercolor,
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          textColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: isActive == true ? Appcolor.white : Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            body,
            style: TextStyle(
                fontSize: 15,
                color: isActive == true ? Appcolor.white : Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
