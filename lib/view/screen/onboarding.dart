import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/onboarding_controler.dart';

import '../widget/onboarding/coustomButton.dart';
import '../widget/onboarding/coustomslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingcontrolerImp());
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(flex: 4, child: CoustomSliderOnBoarding()),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                CoustomDotcontrolerOnBounding(),
                CoustomButtononBording()
              ],
            ))
      ],
    )));
  }
}
