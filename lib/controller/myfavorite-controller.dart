import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/myfavorite.dart';
import 'package:untitled/data/model/myfavorite.dart';

abstract class MyFavoritcontroller extends SearchMixController {
  getData();
  deletfromfavirote(String id);
}

class MyFavoritcontrollerImp extends MyFavoritcontroller {
  MyServices myServices = Get.find();
  @override
  Statusrequest statusrequest = Statusrequest.none;
  List<MyFavoriteModel> data = [];
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusrequest = Statusrequest.lodaing;
    var responce =
        await myFavoriteData.getData(myServices.sharedpref.getString("id")!);
    print("==========================$responce");
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        List responcedata = responce['data'];
        data.addAll(responcedata.map((e) => MyFavoriteModel.fromJson(e)));
        print(data);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  deletfromfavirote(favoritid) async {
    var responce = myFavoriteData.deletData(favoritid);
    print("==========================$responce");
    if (Statusrequest.success == statusrequest) {
      data.removeWhere((element) => element.favoriteId == favoritid);
    } else {
      statusrequest = Statusrequest.failure;
    }
    update();
  }
}
