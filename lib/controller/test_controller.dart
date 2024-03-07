import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/data/datasource/remote/dataetst.dart';

import '../core/functions/handlingdata_controller.dart';

class TestController extends GetxController {
  Testdata testdata = Testdata(Get.find());

  List data = [];

  late Statusrequest statusrequest;

  getdata() async {
    statusrequest = Statusrequest.lodaing;
    var responce = await testdata.getdata();
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        data.addAll(responce['data']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
