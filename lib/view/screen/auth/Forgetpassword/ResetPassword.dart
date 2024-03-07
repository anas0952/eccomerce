import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/forgetpassword/resetpassword-controler.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/functions/vaidtext.dart';
import 'package:untitled/view/widget/auth/coustomTextFormauth.dart';
import 'package:untitled/view/widget/auth/coustomtextbodyauth.dart';
import 'package:untitled/view/widget/auth/coustomtexttitleauth.dart';

import '../../../widget/auth/coustomButtonAuth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordcontrolerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.backgroudcolor,
          elevation: 0.0,
          title: Text('10forget'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Appcolor.grey)),
        ),
        body: GetBuilder<ResetPasswordcontrolerImp>(
            builder: (controller) => HandlingDataViewRequest(
                statusrequest: controller.statusrequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      CoustomtextTitleAuth(text: "15pass".tr), // phone
                      const SizedBox(
                        height: 20,
                      ),
                      CoustomTextBodyAuth(
                          text: "bodySignUp".tr), //plase Enter new password
                      CoustomTextFormaAuth(
                        obscureText: controller.isshowpassword,
                        type: false,
                        validator: (val) {
                          return validInput(
                            val: val!,
                            min: 5,
                            max: 20,
                          );
                        },
                        mycontroller: controller.password,
                        hintext: "6".tr, //reEnter your password
                        labeltext: "7".tr,
                        iconData: (Icons.remove_red_eye_outlined),
                        onTapicon: () {
                          controller.showpassword();
                        },
                        // mycontroller: ,
                      ),

                      CoustomTextFormaAuth(
                        obscureText: controller.isshowpassword,
                        type: false,
                        validator: (val) {
                          return validInput(val: val!, min: 5, max: 20);
                        },
                        mycontroller: controller.repassword,
                        hintext: "6".tr, //reEnter your password
                        labeltext: "6pass".tr,
                        iconData: (Icons.remove_red_eye_outlined),
                        onTapicon: () {
                          controller.showpassword();
                        },
                        // mycontroller: ,
                      ),

                      CoustomButtonAuth(
                        text: "15".tr, //save
                        onPressed: () {
                          controller.gotosuccessResetpassword();
                        },
                      ),
                    ]),
                  ),
                ))));
  }
}
