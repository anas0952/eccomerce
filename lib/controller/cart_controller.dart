import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/cartdata.dart';
import 'package:untitled/data/model/cartmodel.dart';
import 'package:untitled/data/model/couponmodel.dart';

abstract class CartController extends GetxController {
  add(String itemsid);
  delete(String itemsid);
  view();
  resetVarcart();
  refreshpage();
  gotopagecheckout();
}

class CartControllerImp extends CartController {
  late Statusrequest statusrequest;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  int countitem = 0;
  TextEditingController? controllercoupon;
  //varible order
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  //end varible
  //coupon
  CouponModel? couponModel;
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;
  @override
  void onInit() {
    view();
    controllercoupon = TextEditingController();
    super.onInit();
  }

  @override
  add(itemsid) async {
    statusrequest = Statusrequest.lodaing;
    update();
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
  delete(itemsid) async {
    statusrequest = Statusrequest.lodaing;
    update();
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
  view() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce =
        await cartData.viewcart(myServices.sharedpref.getString("id")!);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        if (responce['data']['status'] == "success") {
          List responcedata = responce['data']['data'];
          Map responcedatacountprice = responce['countprice'];
          data.clear();
          data.addAll(responcedata.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(responcedatacountprice['itemscount']);
          priceorders = double.parse(responcedatacountprice['itemsprice']);
        }
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await cartData.checkcoupon(controllercoupon!.text);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        Map<String, dynamic> dataCoupon = responce['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountcoupon = int.parse(couponModel!.couponDescount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        discountcoupon = 0;
        couponid = null;
        couponname = null;
        Get.snackbar("Warning", "This Coupone is not valid ");
      }
    }
    update();
  }

  gettotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  @override
  resetVarcart() {
    priceorders = 0.0;
    totalcountitems = 0;
    data.clear();
  }

  @override
  refreshpage() {
    resetVarcart();
    view();
  }

  @override
  gotopagecheckout() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السلة فارغة");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": discountcoupon.toString(),
    });
  }
}
