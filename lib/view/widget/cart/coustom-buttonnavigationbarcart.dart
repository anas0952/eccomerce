import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/cart_controller.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/view/widget/cart/bottonorder.dart';
import 'package:untitled/view/widget/cart/coustombutoncoupon.dart';

class ButtomNavigationCart extends GetView<CartControllerImp> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onConfirm;
  final String timeDelivery;
  const ButtomNavigationCart({
    super.key,
    required this.price,
    required this.discount,
    required this.totalprice,
    required this.controllercoupon,
    required this.onConfirm,
    required this.shipping,
    required this.timeDelivery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartControllerImp>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: const InputDecoration(
                                hintText: "Coupon Code",
                                hintStyle: TextStyle(
                                  fontFamily: "sans",
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                border: OutlineInputBorder()),
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          flex: 1,
                          child: CoustomButtonCoupon(
                              textbutton: "Confirm", onPressed: onConfirm))
                    ]),
                  )
                : Center(
                    child: Text(
                      "Coupon Code ${controller.couponname}",
                      style: const TextStyle(fontSize: 19, color: Colors.green),
                    ),
                  )),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Appcolor.primarycolor, width: 1)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "price",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text("$price \$", style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Discount",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text("$discount %", style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Shoping",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text("$shipping \$", style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "TimeDelivery",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text("$timeDelivery minute",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 22,
                          color: Appcolor.primarycolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("$totalprice \$",
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Appcolor.primarycolor)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CoustomButtonCart(
            textbutton: "Order",
            onPressed: () {
              controller.gotopagecheckout();
            })
      ],
    ));
  }
}
