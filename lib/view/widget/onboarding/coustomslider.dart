import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/onboarding_controler.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CoustomSliderOnBoarding extends GetView<OnBoardingcontrolerImp> {
  const CoustomSliderOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onpagechange(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(onBoardingList[index].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                onBoardingList[index].image!,
                height: 250,
                width: Get.width / 1.5,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(onBoardingList[index].body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        height: 2, color: Appcolor.grey, fontSize: 17)),
              )
            ],
          );
        });
  }
}
