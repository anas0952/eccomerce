import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/address/adddetails_controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/shared/coustombutton.dart';
import 'package:untitled/core/shared/coustomtextlocation.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressDetailsControllerImp controller =
        Get.put(AddressDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Details Address',
          ),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: GetBuilder<AddressDetailsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: ListView(
                    children: [
                      CoustomTextLocation(
                          hintext: "name",
                          labeltext: "Enter name  ",
                          iconData: Icons.location_city,
                          mycontroller: controller.name,
                          validator: (val) {
                            return null;
                          },
                          type: false),
                      CoustomTextLocation(
                          hintext: "city",
                          labeltext: "Enter City ",
                          iconData: Icons.my_location,
                          mycontroller: controller.city,
                          validator: (val) {
                            return null;
                          },
                          type: false),
                      CoustomTextLocation(
                          hintext: "street",
                          labeltext: "Enter Street ",
                          iconData: Icons.home_work_sharp,
                          mycontroller: controller.street,
                          validator: (val) {
                            return null;
                          },
                          type: false),
                      CoustomButtonLocation(
                        text: "Add Location",
                        onPressed: () {
                          controller.addaddress();
                        },
                      )
                    ],
                  )),
            )));
  }
}
