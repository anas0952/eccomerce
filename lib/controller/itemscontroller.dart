import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/items.dart';
import 'package:untitled/data/model/itemsmodel.dart';

abstract class ItemsController extends SearchMixController {
  inintialdata();
  changcat(int val, String catval);
  getItems(String categoryid);
  getdetalisitems(ItemsModel itemsmodel);
}

class ItemControllerImp extends ItemsController {
  List categores = [];
  String? categoryid;
  int? selectcat;
  double starsnumber = 1;
  @override
  Statusrequest statusrequest = Statusrequest.none;
  List data = [];
  ItemsData itemsData = ItemsData(Get.find());
  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    search = TextEditingController();
    inintialdata();
    super.onInit();
  }

  @override
  inintialdata() {
    categores = Get.arguments['categories'];
    selectcat = Get.arguments['selectcat'];
    categoryid = Get.arguments['categoryid'];
    getItems(categoryid!);
  }

  @override
  changcat(val, catval) {
    selectcat = val;
    categoryid = catval.toString();
    getItems(
      categoryid!,
    );
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusrequest = Statusrequest.lodaing;
    var responce = await itemsData.getData(
      categoryid,
      myServices.sharedpref.getString("id")!,
    );
    update();
    print('=============================$responce');
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
  getdetalisitems(itemsmodel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {"itemsmodel": itemsmodel});
  }

  // getItemsstars(String itemsmodel, double stars) async {
  //   statusrequest = Statusrequest.lodaing;
  //   update();
  //   var responce = await itemsData.getDatastars(
  //       myServices.sharedpref.getString("id")!, itemsmodel, stars.toString());
  //   print('=============================$responce');
  //   print(responce);
  //   statusrequest = hanglingdata(responce);
  //   if (Statusrequest.success == statusrequest) {
  //     if (responce['status'] == "success") {

  //     } else {
  //       statusrequest = Statusrequest.failure;
  //     }
  //   }
  //   update();
  // }
}
