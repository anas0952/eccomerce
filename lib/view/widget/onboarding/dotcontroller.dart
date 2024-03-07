import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/onboarding_controler.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CoustomDotcontrolerOnBounding extends StatelessWidget {
  const CoustomDotcontrolerOnBounding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingcontrolerImp>(
        builder: (controler) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(microseconds: 900),
                          width: controler.currentpage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Appcolor.primarycolor,
                              borderRadius: BorderRadius.circular(10)),
                        )),
              ],
            ));
  }
}
