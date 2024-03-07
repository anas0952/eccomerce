import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/localization/changelocale.dart';
import 'package:untitled/view/widget/language/coustomButton.dart';

class Language extends GetView<Localcontroler> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            CoustomButtonLang(
              textbutton: "Arabic",
              onPressed: () {
                controller.cahngeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            CoustomButtonLang(
              textbutton: "English",
              onPressed: () {
                controller.cahngeLang("en");
                Get.toNamed(AppRoute.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
