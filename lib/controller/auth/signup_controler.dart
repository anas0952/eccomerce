import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/data/datasource/remote/auth/signup.dart';

import '../../core/functions/handlingdata_controller.dart';

abstract class SignUpcontroller extends GetxController {
  signUp();
  // gocheckemail();
}

class SignUpcontrolerImp extends SignUpcontroller {
  //controler

  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;

  //Datarequest
  SignUpData signUpData = SignUpData(Get.find());
  List data = [];
  Statusrequest statusrequest = Statusrequest.none;
  //end
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isshowpassword = true;

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.lodaing;
      update();
      var responce = await signUpData.postdata(
          username.text, email.text, password.text, phone.text);
      print("==================$responce");
      statusrequest = hanglingdata(responce);
      if (Statusrequest.success == statusrequest) {
        if (responce['status'] == "success") {
          Get.offNamed(AppRoute.verficodeSignUp, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number Or Email Already Exists");
          statusrequest = Statusrequest.failure;
        }
      }
      // Get.offNamed(AppRoute.verficodeSignUp);
    }
    update();
  }

  login() {
    Get.offNamed(AppRoute.login);
  }

  // @override
  // gocheckemail() {
  //   // TODO: implement gosignUp
  //   throw UnimplementedError();
  // }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  //auto despoce !
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
