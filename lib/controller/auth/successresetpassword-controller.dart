import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';

abstract class SuccessResetpasswordControler extends GetxController {
  gotoPageLogin();
}

class SuccessResetpasswordControlerImp extends SuccessResetpasswordControler {
  @override
  gotoPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
