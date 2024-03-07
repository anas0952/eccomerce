import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/auth/successresetpassword-controller.dart';

import '../../../core/constant/color.dart';
import '../../widget/auth/coustomButtonAuth.dart';

class SuccesssResetPassword extends StatelessWidget {
  const SuccesssResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetpasswordControlerImp controler =
        Get.put(SuccessResetpasswordControlerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.backgroudcolor,
          elevation: 0.0,
          title: Text('successAppbar'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Appcolor.grey))),
      body: Container(
          child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: const Icon(
                Icons.check_circle_outline_sharp,
                color: Colors.green,
                weight: 900,
                size: 200,
              )),
          Text(
            "successs".tr,
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
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: CoustomButtonAuth(
              text: "titlesuccess".tr,
              onPressed: () {
                controler.gotoPageLogin();
              },
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }
}
