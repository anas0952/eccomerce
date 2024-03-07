import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:untitled/controller/orders/pindingcontroller.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/data/model/ordersmodel.dart';

class CardpindingOrder extends GetView<OrderPindingController> {
  final OrdersModel listdata;

  const CardpindingOrder({
    super.key,
    required this.listdata,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${'111'.tr} ${listdata.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse("${listdata.ordersDatetime}").fromNow(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.primarycolor),
                )
              ],
            ),
            const Divider(),
            Text(
                "${'102'.tr}  : ${controller.printOrderType(listdata.ordersType!)}"),
            Text("${'103'.tr}  : ${listdata.ordersPrice} \$"),
            Text("${'104'.tr}  : ${listdata.ordersPricedelivery} \$"),
            Text(
                "${'105'.tr}  : ${controller.printpaymentMethod(listdata.ordersPaymentmethod!)}"),
            Text(
                "${'112'.tr}  : ${controller.printOrderstatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "${'106'.tr}  : ${listdata.ordersTotalprice} \$",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent),
                ),
                const Spacer(),
                MaterialButton(
                  padding: const EdgeInsets.all(7),
                  color: Colors.deepPurpleAccent,
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  child: Text(
                    '101'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (listdata.ordersStatus == "0")
                  MaterialButton(
                    padding: const EdgeInsets.all(7),
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      controller.deletedata(listdata.ordersId!);
                    },
                    child: Text(
                      '101a'.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
