import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/checkout-controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/constant/imageAsset.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/view/widget/cart/bottonorder.dart';
import 'package:untitled/view/widget/checkout/cardaddresstype.dart';
import 'package:untitled/view/widget/checkout/carddelvirytype.dart';
import 'package:untitled/view/widget/checkout/cardpaymentmethod.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
        bottomNavigationBar: CoustomButtonCart(
            textbutton: "Check Out ",
            onPressed: () {
              print("object");
              controller.checkoutorder();
            }),
        appBar: AppBar(
          title: const Text('Check Out'),
        ),
        body: GetBuilder<CheckOutController>(
            builder: (controller) => HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        const Text(
                          "Choose Payment Method",
                          style: TextStyle(
                              color: Appcolor.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosepaymentMethode("0"); //0 => cash
                          },
                          child: CardPaymentMethodCheckout(
                              title: "Cash On Delivery",
                              isActive: controller.paymentMethod == "0"
                                  ? true
                                  : false),
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosepaymentMethode("1"); //1 => cards
                          },
                          child: CardPaymentMethodCheckout(
                              title: "Payment Cards",
                              isActive: controller.paymentMethod == "1"
                                  ? true
                                  : false),
                        ),
                        const Text(
                          "Choose Delivery Type",
                          style: TextStyle(
                              color: Appcolor.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller
                                    .chooseDeliverytype("0"); //0 => delivery
                              },
                              child: CardDeliveryTypeCheckOut(
                                  imagename: AppimageAsset.deleviry,
                                  title: "Delivery",
                                  active: controller.delvirytype == "0"
                                      ? true
                                      : false),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                controller
                                    .chooseDeliverytype("1"); //1 => recive
                              },
                              child: CardDeliveryTypeCheckOut(
                                  imagename: AppimageAsset.delevirycar,
                                  title: "Recive",
                                  active: controller.delvirytype == "1"
                                      ? true
                                      : false),
                            ),
                          ],
                        ),
                        if (controller.delvirytype == "0")
                          if (controller.dataaddress.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "checkout7".tr,
                                style: const TextStyle(
                                    fontSize: 22, color: Appcolor.primarycolor),
                              ),
                            ),
                        if (controller.delvirytype == "0")
                          if (controller.dataaddress.isEmpty)
                            ElevatedButton.icon(
                                onPressed: () {
                                  Get.offNamed(AppRoute.addressadd);
                                },
                                icon: const Icon(Icons.maps_home_work_rounded),
                                label: Text(
                                  "checkout7a".tr,
                                  style: const TextStyle(
                                      fontSize: 17.5,
                                      color: Appcolor.secouncolor),
                                )),
                        if (controller.delvirytype == "0")
                          if (controller.dataaddress.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Shipping Address",
                                  style: TextStyle(
                                      color: Appcolor.primarycolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ...List.generate(
                                  controller.dataaddress.length,
                                  (index) => InkWell(
                                    onTap: () {
                                      controller.chooseshippingAddress(
                                          controller
                                              .dataaddress[index].addressId!);
                                    },
                                    child: CardShppingAddressCheckOut(
                                        title:
                                            "${controller.dataaddress[index].addressName}",
                                        body:
                                            "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                        isActive: controller.addressid ==
                                                controller.dataaddress[index]
                                                    .addressId
                                            ? true
                                            : false),
                                  ),
                                )
                              ],
                            )
                      ],
                    ),
                  ),
                )));
  }
}






//  Container(
//                   height: 160,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Appcolor.primarycolor)),
//                   child: Column(children: [
//                     SizedBox(
//                         width: 120,
//                         height: 120,
//                         child: Lottie.asset(
//                           AppimageAsset.deleviry,
//                           repeat: true,
//                         )),
//                     const Text(
//                       "Delivery",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     )
//                   ]),
//                 ),