import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/data/datasource/remote/offerse.dart';
import 'package:untitled/data/model/itemsmodel.dart';

class OfferseController extends SearchMixController {
  @override
  late Statusrequest statusrequest;
  OfferseData offerseData = OfferseData(Get.find());
  List<ItemsModel> data = [];

  getofferse() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await offerseData.getDataofferse();
    statusrequest = hanglingdata(responce);
    print("================$responce");
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        List listdata = responce['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getofferse();
    search = TextEditingController();
    super.onInit();
  }
}
