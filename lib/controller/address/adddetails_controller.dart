import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/address-data.dart';

abstract class AddressDetailsController extends GetxController {
  initialData();
}

class AddressDetailsControllerImp extends AddressDetailsController {
  Statusrequest statusrequest = Statusrequest.none;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? long;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  @override
  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print("lattiude $lat");
    print("lattiude $long");
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  addaddress() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await addressData.addData(
      myServices.sharedpref.getString("id")!,
      city!.text,
      street!.text,
      lat!,
      long!,
      name!.text,
    );
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        Get.snackbar("Notice", "Now  , You Can Order To this Address");
        Get.offAllNamed(AppRoute.homepage);
      } else {
        statusrequest = Statusrequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
