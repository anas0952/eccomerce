import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/functions/alertexitapp.dart';
import 'package:untitled/core/functions/vaidtext.dart';
import 'package:untitled/view/widget/auth/coustomTextFormauth.dart';
import 'package:untitled/view/widget/auth/coustomtextbodyauth.dart';
import 'package:untitled/view/widget/auth/coustomtexttitleauth.dart';
import 'package:untitled/view/widget/auth/logoauth.dart';
import 'package:untitled/view/widget/auth/textsignup.dart';

import '../../../controller/auth/login_controler.dart';
import '../../widget/auth/coustomButtonAuth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.backgroudcolor,
          elevation: 0.0,
          title: Text('title'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Appcolor.grey)),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataViewRequest(
                      statusrequest: controller.statusrequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const LogoAuth(),
                              CoustomtextTitleAuth(text: "2".tr),
                              const SizedBox(
                                height: 20,
                              ),
                              CoustomTextBodyAuth(text: "3".tr),
                              CoustomTextFormaAuth(
                                type: false,
                                validator: (val) {
                                  return validInput(
                                      val: val!,
                                      min: 5,
                                      max: 100,
                                      type: "email");
                                },
                                mycontroller: controller.email,
                                hintext: "4".tr,
                                labeltext: "5".tr,
                                iconData: (Icons.email_outlined),
                                // mycontroller: ,
                              ),
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => CoustomTextFormaAuth(
                                  onTapicon: () {
                                    controller.showpassword();
                                  },
                                  obscureText: controller.showpass,
                                  type: false,
                                  validator: (val) {
                                    return validInput(
                                        val: val!,
                                        min: 8,
                                        max: 30,
                                        type: "password");
                                  },
                                  mycontroller: controller.password,
                                  hintext: "6".tr,
                                  labeltext: "7".tr,
                                  iconData: (Icons.remove_red_eye_sharp),
                                  // mycontroller: ,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.gotoForgetPassword();
                                },
                                child: Text(
                                  "8".tr,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              CoustomButtonAuth(
                                text: "10SignUp".tr,
                                onPressed: () async {
                                  await controller.login();
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CoustomTextsignUpoRsignIn(
                                  textone: "9".tr,
                                  texttow: "10".tr,
                                  onTap: () {
                                    controller.gosignUp();
                                  })
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
