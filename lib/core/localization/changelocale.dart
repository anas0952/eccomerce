import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/appthem.dart';
import 'package:untitled/core/functions/fcmconfig.dart';
import 'package:untitled/core/services/services.dart';

class Localcontroler extends GetxController {
  Locale? Language;
  MyServices myServices = Get.find();
  ThemeData appthem = themEnglish;
  cahngeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedpref.setString("lang", langcode);
    appthem = langcode == "ar" ? themarabic : themEnglish;
    Get.changeTheme(appthem);
    Get.updateLocale(locale);
  }

  requsetperLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("per1".tr, "per2".tr);
    }
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.snackbar("per1".tr, "per3".tr);
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("per1".tr, "per4".tr);
    }
  }

  @override
  void onInit() {
    //messageNotification
    firebasecloudmessage();
    requestpermissionNotification();
    //end messageNotification
    requsetperLocation();
    String? sharedprefLang = myServices.sharedpref.getString("lang");
    if (sharedprefLang == "ar") {
      Language = const Locale("ar");
      appthem = themarabic;
      Get.changeTheme(appthem);
    } else if (sharedprefLang == "en") {
      Language = const Locale("en");
      appthem = themEnglish;
      Get.changeTheme(appthem);
    } else {
      Language = Locale(Get.deviceLocale!.languageCode);
      appthem = themEnglish;
    }

    super.onInit();
  }
}
