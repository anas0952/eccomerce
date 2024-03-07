import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/services/services.dart';

import '../data/datasource/static/static.dart';

abstract class OnBoardingcontroler extends GetxController {
  next();
  onpagechange(int index);
}

class OnBoardingcontrolerImp extends OnBoardingcontroler {
  MyServices myServices = Get.find();
  int currentpage = 0;
  late PageController pageController;
  @override
  next() {
    currentpage++;
    if (currentpage + 1 > onBoardingList.length) {
      myServices.sharedpref.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechange(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
