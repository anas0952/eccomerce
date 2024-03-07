import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/screen/home.dart';
import 'package:untitled/view/screen/notificatoin.dart';
import 'package:untitled/view/screen/offerse.dart';
import 'package:untitled/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changedpage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> listpage = [
    const HomePage(),
    const Notificatoin(),
    const Offerse(),
    const Settings()
  ];

  List botomappbar = [
    {"icon": Icons.home_outlined},
    {"icon": Icons.notifications_active_outlined},
    {"icon": Icons.local_offer_outlined},
    {"icon": Icons.settings}
  ];

  @override
  changedpage(int i) {
    currentPage = i;
    update();
  }
}
