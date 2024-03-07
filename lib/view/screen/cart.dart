import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/cart_controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/functions/translationdatabase.dart';
import 'package:untitled/view/widget/cart/cardlist.dart';
import 'package:untitled/view/widget/cart/coustom-buttonnavigationbarcart.dart';
import 'package:untitled/view/widget/cart/topappbartcart.dart';

class Mycart extends StatelessWidget {
  const Mycart({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp cartcontroller = Get.put(CartControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Cart",
          ),
        ),
        bottomNavigationBar: GetBuilder<CartControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: ButtomNavigationCart(
                    shipping: "30",
                    controllercoupon: controller.controllercoupon!,
                    onConfirm: () {
                      controller.checkCoupon();
                    },
                    price: "${cartcontroller.priceorders}",
                    discount: "${controller.discountcoupon}",
                    totalprice: "${cartcontroller.gettotalPrice()}",
                    timeDelivery: myServices.sharedpref.getString("time")!,
                  ),
                )),
        body: GetBuilder<CartControllerImp>(
            builder: (controller) => HandlingDataView(
                statusrequest: controller.statusrequest,
                widget: ListView(
                  children: [
                    TopAppBarCart(
                        message:
                            "You Have ${controller.totalcountitems} product in Your List"),
                    ...List.generate(
                        controller.data.length,
                        (index) => CoustomCartList(
                            onadd: () async {
                              await controller
                                  .add("${controller.data[index].itemsId}");
                              cartcontroller.refreshpage();
                            },
                            ondelete: () async {
                              await controller
                                  .delete("${controller.data[index].itemsId}");
                              cartcontroller.refreshpage();
                            },
                            imagename: "${controller.data[index].itemsImage}",
                            name: "${controller.data[index].itemsName}",
                            price: "${controller.priceorders}",
                            count: "${controller.data[index].countitem}"))
                  ],
                ))));
  }
}
