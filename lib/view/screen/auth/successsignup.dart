import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/color.dart';

import '../../../controller/auth/successsignup-controller.dart';
import '../../widget/auth/coustomButtonAuth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControlerImp controller = Get.put(SuccessSignUpControlerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.backgroudcolor,
          elevation: 0.0,
          title: Text("successAppbar".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Appcolor.grey))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: const Icon(
                  Icons.check_circle_outline_sharp,
                  color: Colors.green,
                  weight: 900,
                  size: 200,
                )),
            Text(
              "successs ".tr,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "success".tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: CoustomButtonAuth(
                text: "titlesuccess".tr,
                onPressed: () {
                  controller.gotoPageLogin();
                },
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        )),
      ),
    );
  }
}
