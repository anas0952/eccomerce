import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  Get.defaultDialog(title: "app4".tr, middleText: "app1".tr, actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("app2".tr)), //confirm
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("app3".tr))
  ]);
  return Future.value(true);
}
