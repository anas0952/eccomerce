import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/view/widget/auth/coustomtextbodyauth.dart';
import 'package:untitled/view/widget/auth/coustomtexttitleauth.dart';

import '../../../../controller/forgetpassword/verifycode-controler.dart';
import '../../../../core/constant/imageAsset.dart';

class VeryFiCode extends StatelessWidget {
  const VeryFiCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodecontrolerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.backgroudcolor,
          elevation: 0.0,
          title: Text('10Feryfycode'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Appcolor.grey)),
        ),
        body: GetBuilder<VerifycodecontrolerImp>(
            builder: (controller) => HandlingDataViewRequest(
                statusrequest: controller.statusrequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: ListView(
                    children: [
                      CoustomtextTitleAuth(text: "15code".tr),
                      const SizedBox(
                        height: 20,
                      ),
                      CoustomTextBodyAuth(text: "bodySignUp".tr),

                      SizedBox(
                        width: 250,
                        height: 250,
                        child: Card(
                          shadowColor: Appcolor.buttoncolor,
                          child: Image.asset(AppimageAsset.successSignUp),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      OtpTextField(
                        fieldWidth: 50,
                        numberOfFields: 5,
                        borderColor: const Color(0xFF512DA8),
                        fillColor: Colors.red,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,

                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.checkcode(verificationCode);
                        }, // end onSubmit
                      )
                      // CoustomTextFormaAuth(
                      //   mycontroller: controler.email,
                      //   hintext: "4".tr,
                      //   labeltext: "5".tr,
                      //   iconData: (Icons.email_outlined),
                      //   // mycontroller: ,
                      // ),
                    ],
                  ),
                ))));
  }
}
