import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/itemsdetails.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/view/widget/itemsdetails/priceandcount.dart';
import 'package:untitled/view/widget/itemsdetails/toppageitemsdetails.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
              elevation: 200,
              splashColor: Appcolor.primarycolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color(0xff212A3E),
              onPressed: () {
                Get.toNamed(AppRoute.mycart);
              },
              child: const Text(
                "Go \t To \t Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
        body: GetBuilder<ItemsDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusrequest: controller.statusrequest,
                widget: ListView(children: [
                  const TopPageDetails(),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.itemsmodel.itemsName!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Appcolor.black,
                                  fontSize: 25,
                                  letterSpacing: 1.5)),
                      const SizedBox(
                        height: 10,
                      ),
                      PriceAndCountItem(
                          onAdd: () {
                            controller.add();
                            // controller.refreshpage();
                          },
                          onremove: () {
                            controller.delete();
                            // controller.refreshpage();
                          },
                          price: "${controller.itemsmodel.itemsdescount}",
                          count: "${controller.countitem}"),
                      Text(controller.itemsmodel.itemsDesc!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black87, fontSize: 18)),
                    ],
                  ),
                ]))));
  }
}
