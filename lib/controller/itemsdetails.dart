import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/cartdata.dart';
import 'package:untitled/data/model/cartmodel.dart';
import 'package:untitled/data/model/itemsmodel.dart';

abstract class ItemsDetailsController extends GetxController {
  add();
  delete();
  getcountitem(String itemsid);
  additems(String itemsid);
  deleteitems(String itemsid);
  resetVarcart();
  refreshpage();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModel itemsmodel;
  // CartControllerImp cartController = Get.put(CartControllerImp());

  late Statusrequest statusrequest;
  int countitem = 0;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());

  // function
  /////////////////////////
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;

  List image = [];
  PageController? pc;
  int indexpage = 1;

  pagenew(index) {
    indexpage = index;
    indexpage++;
    print(indexpage);
    update();
  }

  //
  @override
  void onInit() {
    initialData();
    // getimages();

    pc = PageController();
    super.onInit();
  }

  initialData() async {
    statusrequest = Statusrequest.lodaing;
    itemsmodel = Get.arguments['itemsmodel'];
    countitem = await getcountitem(itemsmodel.itemsId!);
    statusrequest = Statusrequest.success;
    update();
  }

  List subItems = [
    {"name": "red", "id": 1, "active": "1"},
    {"name": "Black", "id": 2, "active": "1"},
    {"name": "Blue", "id": 3, "active": "0"}
  ];

  @override
  additems(itemsid) async {
    statusrequest = Statusrequest.lodaing;
    var responce =
        await cartData.addCart(myServices.sharedpref.getString("id")!, itemsid);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  deleteitems(itemsid) async {
    statusrequest = Statusrequest.lodaing;
    var responce = await cartData.deleteCart(
        myServices.sharedpref.getString("id")!, itemsid);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم حذف المنتج من السلة "));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  add() {
    additems(itemsmodel.itemsId!);
    countitem++;
    update();
  }

  @override
  delete() {
    if (countitem > 0) {
      deleteitems(itemsmodel.itemsId!);
      countitem--;
      update();
    }
  }

  @override
  getcountitem(itemsid) async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await cartData.getcountcart(
        myServices.sharedpref.getString("id")!, itemsid);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        countitem = int.parse(responce['data']);
        print("==================================");
        print("$countitem");
        return countitem;
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  // getimages() async {
  //   statusrequest = Statusrequest.lodaing;
  //   update();
  //   var responce = await cartData.getDataimages(itemsmodel.itemsId!);
  //   statusrequest = hanglingdata(responce);
  //   if (Statusrequest.success == statusrequest) {
  //     if (responce['status'] == "success") {
  //       image.clear();
  //       print("==================================");
  //       image.addAll(responce['data']);
  //     } else {
  //       statusrequest = Statusrequest.none;
  //     }
  //     update();
  //   }
  // }

  @override
  resetVarcart() {
    priceorders = 0.0;
    totalcountitems = 0;
    data.clear();
  }

  @override
  refreshpage() {
    resetVarcart();
    update();
  }
}
