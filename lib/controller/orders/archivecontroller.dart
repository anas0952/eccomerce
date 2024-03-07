import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/orders/archive.dart';
import 'package:untitled/data/model/ordersmodel.dart';

class OrdersArchiveController extends GetxController {
  late Statusrequest statusrequest;
  OrdersArchive ordersArchive = OrdersArchive(Get.find());
  List<OrdersModel> data = [];
  late OrdersModel ordersModel;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    getDataArchive();
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
      return "109a".tr;
    } else if (val == "3") {
      return "109".tr;
    } else {
      return "110".tr;
    }
  }

  getDataArchive() async {
    data.clear();
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await ordersArchive.getDataArchive(
        usersid: myServices.sharedpref.getString("id")!);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        List listdata = responce['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.none;
      }
    }
    update();
  }

  submitRatting(String ordersid, double rating, String noterating) async {
    data.clear();
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await ordersArchive.getDatarating(
        ordersid: ordersid, rating: rating.toString(), noterating: noterating);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        getDataArchive();
      } else {
        statusrequest = Statusrequest.none;
      }
    }
    update();
  }

  refreashorderpinding() {
    getDataArchive();
  }
}
