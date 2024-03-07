import 'package:get/get.dart';
import 'package:untitled/core/services/services.dart';

MyServices myServices = Get.find();
translationdatabase(columnar, columnen) {
  if (myServices.sharedpref.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
