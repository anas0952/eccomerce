import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/data/datasource/remote/forgetpassword/verfiycode.dart';

import '../../core/functions/handlingdata_controller.dart';

abstract class Verifycodecontroler extends GetxController {
  checkcode(verfiycode);
}

class VerifycodecontrolerImp extends Verifycodecontroler {
  String? email;

  VeriFiycodeForgetPasswordData veriFiycodeForgetPasswordData =
      VeriFiycodeForgetPasswordData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  //controler

  @override
  checkcode(verfiycode) async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce =
        await veriFiycodeForgetPasswordData.postData(email!, verfiycode);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {
          "email": email,
        });
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verifiy Code Not Correct");
        statusrequest = Statusrequest.failure;
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
