import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:untitled/core/class/handlingdataview.dart';
// import 'package:untitled/controller/auth/signup_controler.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/view/widget/auth/coustomtextbodyauth.dart';

import '../../../controller/auth/veryficodesignup.dart';

class VeryFiCodeSignup extends StatelessWidget {
  const VeryFiCodeSignup({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerFycodeSignUpImp());
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
        body: GetBuilder<VerFycodeSignUpImp>(
            builder: (controller) => HandlingDataViewRequest(
                  statusrequest: controller.statusrequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: ListView(
                      children: [
                        // CoustomtextTitleAuth(text: "15code".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        CoustomTextBodyAuth(
                            text: "${"bodySignUp".tr}\t ${controller.email}"),
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
                            controller.gotosuccessSignUp(verificationCode);
                          }, // end onSubmit
                        ),
                        //   iconData: (Icons.email_outlined),
                        //   // mycontroller: ,
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          color: Appcolor.buttoncolor,
                          onPressed: () {
                            controller.resend();
                          },
                          child: Text(
                            "ferfycode".tr,
                            style: const TextStyle(
                                color: Appcolor.white,
                                fontFamily: "sans",
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
