import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/functions/alertexitapp.dart';
import 'package:untitled/core/functions/vaidtext.dart';
import 'package:untitled/view/widget/auth/coustomTextFormauth.dart';
import 'package:untitled/view/widget/auth/coustomtextbodyauth.dart';
import 'package:untitled/view/widget/auth/coustomtexttitleauth.dart';
import '../../../controller/auth/signup_controler.dart';
import '../../widget/auth/coustomButtonAuth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpcontrolerImp());
    // Get.lazyPut(() => SignUpcontrolerImp()); => Binding remove textcontain
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.backgroudcolor,
          elevation: 0.0,
          title: Text('tetleSignup'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Appcolor.grey)),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpcontrolerImp>(
              builder: (controller) => HandlingDataViewRequest(
                  statusrequest: controller.statusrequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            CoustomtextTitleAuth(text: "2".tr),
                            const SizedBox(
                              height: 20,
                            ),
                            CoustomTextBodyAuth(text: "bodySignUp".tr),
                            CoustomTextFormaAuth(
                              type: false,
                              // typetext: ,
                              validator: (val) {
                                return validInput(
                                    val: val!,
                                    min: 2,
                                    max: 10,
                                    type: "username");
                              },
                              mycontroller: controller.username,
                              hintext: "11".tr,
                              labeltext: "12".tr,
                              iconData: (Icons.person_outline),
                              // mycontroller: ,
                            ),
                            CoustomTextFormaAuth(
                              type: false,
                              validator: (val) {
                                return validInput(
                                    val: val!, min: 8, max: 40, type: "email");
                              },
                              mycontroller: controller.email,
                              hintext: "4".tr,
                              labeltext: "5".tr,
                              iconData: (Icons.email_outlined),
                              // mycontroller: ,
                            ),
                            CoustomTextFormaAuth(
                              type: true,
                              validator: (val) {
                                return validInput(
                                    val: val!, min: 5, max: 20, type: "phone");
                              },
                              mycontroller: controller.phone,
                              hintext: "13".tr,
                              labeltext: "14".tr,
                              iconData: (Icons.phone_android),
                              // mycontroller: ,
                            ),
                            GetBuilder<SignUpcontrolerImp>(
                              builder: (controller) => CoustomTextFormaAuth(
                                onTapicon: () {
                                  controller.showpassword();
                                },
                                type: false,
                                validator: (val) {
                                  return validInput(val: val!, min: 5, max: 30);
                                },
                                mycontroller: controller.password,
                                hintext: "6".tr,
                                obscureText: controller.isshowpassword,
                                labeltext: "7".tr,
                                iconData: (Icons.remove_red_eye_sharp),
                                // mycontroller: ,
                              ),
                            ),
                            CoustomButtonAuth(
                              text: "10".tr,
                              onPressed: () {
                                controller.signUp();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CoustomTextsignUpoRsignIn(
                                textone: "10sign".tr,
                                texttow: "10SignUp".tr,
                                onTap: () {
                                  controller.login();
                                })
                          ],
                        ),
                      ))),
            )));
  }
}
