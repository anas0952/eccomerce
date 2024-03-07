import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:untitled/controller/orders/archivecontroller.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/constant/imageAsset.dart';

void showDiaogRating(BuildContext context, String ordersid) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: Text(
              'rating1'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: Text(
              'rating2'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            // your app's logo?
            image: CircleAvatar(
              radius: 100,
              child: Image.asset(
                AppimageAsset.rating,
              ),
            ), //const FlutterLogo(size: 100),
            submitButtonText: 'rating3'.tr,
            submitButtonTextStyle: const TextStyle(
                color: Appcolor.secouncolor,
                fontWeight: FontWeight.bold,
                fontSize: 19),
            commentHint: 'rating4'.tr,
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              OrdersArchiveController controller = Get.find();
              controller.submitRatting(
                  ordersid, response.rating, response.comment);
              // print('rating: ${response.rating}, comment: ${response.comment}');
            },
          ));
}
