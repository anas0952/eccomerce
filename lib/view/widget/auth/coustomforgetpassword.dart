import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/forgetpassword/resetpassword-controler.dart';

class CoustomForgitPasswordWithcode extends StatelessWidget {
  const CoustomForgitPasswordWithcode({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordcontrolerImp controler = Get.put(ResetPasswordcontrolerImp());
    return OtpTextField(
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
        controler.gotosuccessResetpassword();
      }, // end onSubmit
    );
  }
}
