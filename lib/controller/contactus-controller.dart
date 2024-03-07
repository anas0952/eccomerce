import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/contactus.dart';

class ContactUsController extends GetxController {
  late TextEditingController number;
  late TextEditingController title;
  late TextEditingController body;
  Statusrequest statusrequest = Statusrequest.none;
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ContactData contactData = ContactData(Get.find());
  @override
  void onInit() {
    number = TextEditingController();
    title = TextEditingController();
    body = TextEditingController();
    super.onInit();
  }

  signUp() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.lodaing;
      update();
      var responce = await contactData.getdata(
          usersid: myServices.sharedpref.getString("id")!,
          number: number.text,
          body: body.text,
          title: title.text);
      print("==================$responce");
      statusrequest = hanglingdata(responce);
      if (Statusrequest.success == statusrequest) {
        if (responce['status'] == "success") {
          Get.offNamed(AppRoute.homepage);
        }
      }
      update();
    }
  }
}
