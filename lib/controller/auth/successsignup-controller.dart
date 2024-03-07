import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';

abstract class SuccessSignUpControler extends GetxController {
  gotoPageLogin();
}

class SuccessSignUpControlerImp extends SuccessSignUpControler {
  @override
  gotoPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
