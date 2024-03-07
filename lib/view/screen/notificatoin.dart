import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:untitled/controller/notification/notification-controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';

class Notificatoin extends StatelessWidget {
  const Notificatoin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Container(
      child: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
              statusrequest: controller.statusrequest,
              widget: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: ListView(
                  children: [
                    Center(
                        child: Text(
                      "notify".tr,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Appcolor.colorshome,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 25,
                    ),
                    ...List.generate(
                        controller.dataremove.length,
                        (index) => Stack(
                              children: [
                                ListTile(
                                  isThreeLine: true,
                                  title: Text(
                                    controller
                                        .dataremove[index].notificatoinTitle!,
                                    style: const TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        fontSize: 18),
                                  ),
                                  subtitle: Text(controller
                                      .dataremove[index].notificatoinBody!),
                                ),
                                Positioned(
                                  right: 5,
                                  child: Text(
                                    Jiffy.parse(controller.dataremove[index]
                                            .notificatoinDatetime!)
                                        .fromNow(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Appcolor.secouncolor),
                                  ),
                                )
                              ],
                            ))
                  ],
                ),
              ))),
    );
  }
}
