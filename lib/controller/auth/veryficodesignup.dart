import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';

import '../../data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerFycodeSignUp extends GetxController {
  resend();
  gotosuccessSignUp(String verfiycodesignUp);
}

class VerFycodeSignUpImp extends VerFycodeSignUp {
  VerfycodeSignupData verfycodeSignupData = VerfycodeSignupData(Get.find());
  String? email;
  Statusrequest statusrequest = Statusrequest.none;
  //controlere;

  @override
  resend() {
    verfycodeSignupData.resenddata(email!);
  }

  @override
  gotosuccessSignUp(String verfiycodesignUp) async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await verfycodeSignupData.postdata(email!, verfiycodesignUp);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        Get.offAllNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "verFiycode is No Excist ");
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
