import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/services/services.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();

  @override
  logout() {
    String users = myServices.sharedpref.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$users");
    myServices.sharedpref.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
