import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/onboarding_controler.dart';

import '../../../core/constant/color.dart';

class CoustomButtononBording extends GetView<OnBoardingcontrolerImp> {
  const CoustomButtononBording({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      onPressed: () {
        controller.next();
      },
      color: Appcolor.buttoncolor,
      textColor: Colors.white,
      child: Text("con".tr),
    );
  }
}
