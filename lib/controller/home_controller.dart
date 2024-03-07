import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/data/datasource/remote/homedata.dart';
import 'package:untitled/data/model/itemsmodel.dart';

import '../core/services/services.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  gotoItem(List categories, int selectcat, String categoryid);
  getdetalisitems(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  @override
  Statusrequest statusrequest = Statusrequest.none;
  @override
  HomeData homeData = HomeData(Get.find());
  String? lang;
  //Data type
  List data = [];
  List categories = [];
  List items = [];
  List offerse = [];
  List settingsdata = [];

  //hometextawait
  String title = "";
  String body = "";
  String text = "";
  String time = "";

  //end hometextawait

  @override
  getdetalisitems(ItemsModel itemsmodel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {"itemsmodel": itemsmodel});
  }

  @override
  initialData() {
    lang = myServices.sharedpref.getString("lang");
    username = myServices.sharedpref.getString("username");
    id = myServices.sharedpref.getString("id");
  }

  @override
  getData() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await homeData.getData();
    print("=====================$responce");
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        categories.addAll(responce['categories']['data']);
        items.addAll(responce['items']['data']);
        settingsdata.addAll(responce['setting']['data']);
        offerse.addAll(responce['listofferse']['data']);

        //starttext
        title = "${settingsdata[0]['settings_title']}";
        body = "${settingsdata[0]['settings_body']}";
        text = "${settingsdata[0]['setting_titledescount']}";
        time = "${settingsdata[0]['setting_deliverytime']}";
        myServices.sharedpref.setString("time", time);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  gotoItem(categories, selectcat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectcat": selectcat,
      "categoryid": categoryid.toString()
    });
  }
}

class SearchMixController extends GetxController {
  TextEditingController? search;
  HomeData homeData = HomeData(Get.find());
  bool isSearch = false;
  List<ItemsModel> datasearch = [];
  late Statusrequest statusrequest;
  //search
  checkSearch(val) {
    if (val == "") {
      statusrequest = Statusrequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItem() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusrequest = Statusrequest.lodaing;
    var responce = await homeData.searchData(search!.text);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        datasearch.clear();
        List dataresponce = responce['data'];
        datasearch.addAll(dataresponce.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }
}
