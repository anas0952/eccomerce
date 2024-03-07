import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:untitled/core/constant/color.dart';

import 'controller/test_controller.dart';
import 'core/constant/imageAsset.dart';

class TestVies extends StatelessWidget {
  const TestVies({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolor.primarycolor,
        ),
        body: Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListView.builder(itemBuilder: (context, index) {
              return Image.asset(AppimageAsset.loading);
            })));
  }
}
