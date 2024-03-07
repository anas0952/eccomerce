import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/data/datasource/remote/forgetpassword/resetpassword.dart';

import '../../core/functions/handlingdata_controller.dart';

abstract class ResetPasswordcontroler extends GetxController {
  // resetpassword();
  gotosuccessResetpassword();
}

class ResetPasswordcontrolerImp extends ResetPasswordcontroler {
  //controler
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

//

  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  String? email;
//

  bool isshowpassword = true;
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  // resetpassword() {}

  @override
  gotosuccessResetpassword() async {
    if (password.text != repassword.text) {
      Get.defaultDialog(title: "Warning", middleText: "Password Not Match");
    }
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.lodaing;
      update();
      var responce = await resetpasswordData.postData(email!, password.text);
      statusrequest = hanglingdata(responce);
      if (Statusrequest.success == statusrequest) {
        Get.toNamed(AppRoute.successResetpassword);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Try Again");
      }
      update();
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  //auto despoce !
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
