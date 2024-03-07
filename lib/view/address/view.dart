import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/address/view.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/data/model/addressmode.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
        floatingActionButton: CircleAvatar(
          radius: 28,
          backgroundColor: Appcolor.primarycolor,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(AppRoute.addressadd);
            },
          ),
        ),
        appBar: AppBar(
          title: Text(
            'locationstart'.tr,
          ),
        ),
        body: GetBuilder<ViewAddressController>(
          builder: (controller) {
            return HandlingDataView(
                statusrequest: controller.statusrequest,
                widget: Container(
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => Card(
                          child: CardAddress(
                              update: () {
                                Get.toNamed(AppRoute.addressadd);
                              },
                              ondelete: () {
                                controller.deleteAddress(
                                    controller.data[index].addressId!);
                              },
                              addressModel: controller.data[index]))),
                ));
          },
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? ondelete;
  final void Function()? update;

  const CardAddress({
    super.key,
    required this.addressModel,
    required this.ondelete,
    this.update,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
          title: Text("${addressModel.addressName}"),
          subtitle: Text("${addressModel.addressStreet}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: ondelete,
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          )),
    );
  }
}
