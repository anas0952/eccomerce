import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetpasswordControler extends GetxController {
  checkEmail();
}

class ForgetpasswordControlerImp extends ForgetpasswordControler {
  //controler
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Statusrequest statusrequest = Statusrequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      statusrequest = Statusrequest.lodaing;
      update();
      var responce = await checkEmailData.postData(email.text);
      statusrequest = hanglingdata(responce);
      if (Statusrequest.success == statusrequest) {
        if (responce['status'] == "success") {
          Get.offAllNamed(AppRoute.verFiycode,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Email Not found");
          statusrequest = Statusrequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
