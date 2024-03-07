import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/functions/vaidtext.dart';
import 'package:untitled/view/widget/auth/coustomTextFormauth.dart';
import 'package:untitled/view/widget/auth/coustomtextbodyauth.dart';
import 'package:untitled/view/widget/auth/coustomtexttitleauth.dart';

import '../../../../controller/forgetpassword/forgetpasswordcontroler.dart';
import '../../../widget/auth/coustomButtonAuth.dart';

class Forgetpassowrd extends StatelessWidget {
  const Forgetpassowrd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetpasswordControlerImp());
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
        body: GetBuilder<ForgetpasswordControlerImp>(
            builder: (controller) => HandlingDataViewRequest(
                statusrequest: controller.statusrequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CoustomtextTitleAuth(text: "2forget".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CoustomTextBodyAuth(text: "bodyforgetpassword".tr),
                        CoustomTextFormaAuth(
                          type: false,
                          validator: (val) {
                            return validInput(
                                val: val!, min: 10, max: 100, type: "email");
                          },
                          mycontroller: controller.email,
                          hintext: "4".tr,
                          labeltext: "5".tr,
                          iconData: (Icons.email_outlined),
                          // mycontroller: ,
                        ),
                        CoustomButtonAuth(
                          text: "2forget".tr,
                          onPressed: () {
                            controller.checkEmail();
                          },
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
