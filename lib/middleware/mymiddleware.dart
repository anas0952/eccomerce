import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/services/services.dart';

class Mymiddlware extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedpref.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homepage);
    }
    if (myServices.sharedpref.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
