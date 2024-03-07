import 'package:get/get.dart';

validInput(
    {required String val, required int min, required int max, String? type}) {
  if (val.isEmpty) {
    return "1txt".tr;
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "2txt".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "3txt".tr;
    }

    if (type == "phone") {
      if (!GetUtils.isPhoneNumber(val)) {
        return "7txt".tr;
      }
    }
  }
  if (val.length < min) {
    return '${"5txt".tr}$min';
  }
  if (val.length > max) {
    return '${"6txt".tr}$max';
  }
}
