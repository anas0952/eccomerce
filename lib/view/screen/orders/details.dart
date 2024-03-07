import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/controller/orders/details.dart';
import 'package:untitled/core/constant/color.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => ListView(
              children: [
                Card(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(children: [
                              Text(
                                "details2".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff96577f),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "details3".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff96577f),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "details5".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff96577f),
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                Card(
                                  child: Container(
                                    color: Colors.white,
                                    child: Text(
                                      "${controller.data[index].itemsName}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Appcolor.secouncolor,
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.white,
                                    child: Text(
                                      "${controller.data[index].countitem}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Appcolor.secouncolor,
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.white,
                                    child: Text(
                                      "${controller.data[index].itemsPrice} \$",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Appcolor.secouncolor,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: Text(
                            "${'details4'.tr} ${controller.ordersModel.ordersTotalprice} \$",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Appcolor.secouncolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        color: Colors.white,
                        child: ListTile(
                          title: Text("${controller.ordersModel.addressCity}"
                              "${controller.ordersModel.addressName}"),
                          subtitle:
                              Text("${controller.ordersModel.addressStreet}"),
                        )),
                  ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          color: Colors.white,
                          height: 300,
                          width: double.infinity,
                          child: GoogleMap(
                            markers: controller.makers.toSet(),
                            mapType: MapType.normal,
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controller.completercontroller!
                                  .complete(controllermap);
                            },
                          )))
              ],
            ),
          )),
    );
  }
}
