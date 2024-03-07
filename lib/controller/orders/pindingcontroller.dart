import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/orders/pindingdata.dart';
import 'package:untitled/data/model/ordersmodel.dart';

class OrderPindingController extends GetxController {
  late Statusrequest statusrequest;
  List<OrdersModel> data = [];
  PindingData pindingData = PindingData(Get.find());

  MyServices myServices = Get.find();

  getItemsPinding() async {
    data.clear();
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await pindingData.getDataPinding(
      usersid: myServices.sharedpref.getString("id")!,
    );
    print('=============================$responce');
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        List listdata = responce['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getItemsPinding();
    super.onInit();
  }

  String printOrderType(String val) {
    if (val == "0") {
      return "100a".tr;
    } else {
      return "100".tr;
    }
  }

  String printpaymentMethod(String val) {
    if (val == "0") {
      return "105a".tr;
    } else {
      return "105aa".tr;
    }
  }

  String printOrderstatus(String val) {
    if (val == "0") {
      return "107".tr;
    } else if (val == "1") {
      return "108".tr;
    } else if (val == "2") {
      return "109".tr;
    } else {
      return "110".tr;
    }
  }

  //refreash page
  refreashorderpinding() {
    getItemsPinding();
  }

  deletedata(String orderid) async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await pindingData.deleteorder(orderid: orderid);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        data.removeWhere((element) => element.ordersId == orderid);
        //getItemsPinding();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }
}
