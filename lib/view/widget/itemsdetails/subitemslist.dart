import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/itemsdetails.dart';
import 'package:untitled/core/constant/color.dart';

class SubItemsList extends GetView<ItemsDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            margin: const EdgeInsets.only(left: 2.5),
            padding: const EdgeInsets.only(top: 13),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subItems[index]['active'] == "1"
                    ? Appcolor.sublistitems
                    : Appcolor.white,
                border: Border.all(color: Appcolor.black),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "${controller.subItems[index]['name']}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: controller.subItems[index]['active'] == "1"
                    ? Colors.white
                    : Appcolor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
