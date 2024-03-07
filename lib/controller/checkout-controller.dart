import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/address-data.dart';
import 'package:untitled/data/datasource/remote/checkout.dart';
import 'package:untitled/data/model/addressmode.dart';

class CheckOutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
  MyServices myServices = Get.find();
  Statusrequest statusrequest = Statusrequest.none;

  String? paymentMethod;
  String? delvirytype;
  String? addressid = "0";

  List<AddressModel> dataaddress = [];
  //parimittter
  late String couponid;
  late String priceorder;
  late String descountcoupon;

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    descountcoupon = Get.arguments['discountcoupon'].toString();
    getshippingAddress();
    super.onInit();
  }

  chooseDeliverytype(String val) {
    delvirytype = val;
    update();
  }

  choosepaymentMethode(String val) {
    paymentMethod = val;
    update();
  }

  chooseshippingAddress(String val) {
    addressid = val;
    update();
  }

  getshippingAddress() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce =
        await addressData.getData(myServices.sharedpref.getString("id")!);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        List listdata = responce['data'];
        print(listdata);
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId;
      } else {
        statusrequest = Statusrequest.none;
      }
    }
    update();
  }

  checkoutorder() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "please Select a Payment method ");
    }
    if (delvirytype == null) {
      return Get.snackbar("Error", "please Select a Order Type ");
    }
    if (dataaddress.isEmpty && delvirytype == "delivery") {
      return Get.snackbar("Error", "please Select Shipping Address ");
    }
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await checkOutData.getdata(
        usersid: myServices.sharedpref.getString("id")!,
        addressid: addressid.toString(),
        orderstype: delvirytype.toString(),
        ordersprice: priceorder,
        pricedelivery: "10",
        discountcoupon: descountcoupon,
        couponid: couponid,
        paymentmethod: paymentMethod.toString());
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "The Order Was SuccessFully");
      } else {
        statusrequest = Statusrequest.none;
        Get.snackbar("Error", "try Again");
      }
    }
    update();
  }
}
