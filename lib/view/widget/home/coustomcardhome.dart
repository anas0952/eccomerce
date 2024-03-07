import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/core/constant/color.dart';

class CoustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  final String text;

  const CoustomCardHome(
      {super.key, required this.title, required this.body, required this.text});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Stack(children: [
                Container(
                  alignment: Alignment.center,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Appcolor.colorshome,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Text(
                      title,
                      style:
                          const TextStyle(color: Appcolor.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      body,
                      style:
                          const TextStyle(color: Appcolor.white, fontSize: 30),
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  right: controller.lang == "en" ? -20 : null,
                  left: controller.lang == "ar" ? -20 : null,
                  child: Container(
                    alignment: Alignment.center,
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Appcolor.ciclercolor,
                        borderRadius: BorderRadius.circular(160)),
                    child: Text(
                      '$text ',
                      style: const TextStyle(
                          color: Appcolor.primarycolor, fontSize: 67),
                    ),
                  ),
                )
              ]),
            ));
  }
}
