import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/controller/address/add-controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressControllerImp controllerpage = Get.put(AddAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'locationtop'.tr,
        ),
      ),
      body: Container(
          child: GetBuilder<AddAddressControllerImp>(
        builder: (controller) => HandlingDataView(
            statusrequest: controllerpage.statusrequest,
            widget: Column(
              children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      children: [
                        GoogleMap(
                          markers: controller.marker.toSet(),
                          onTap: (latlong) {
                            controllerpage.addmarker(latlong);
                            print(latlong);
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.complitercontroller!
                                .complete(controllermap);
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(11)),
                                  border: Border.all(
                                      width: 0.6, style: BorderStyle.solid)),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                margin:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: MaterialButton(
                                  color: Appcolor.secouncolor,
                                  onPressed: () {
                                    controllerpage.gotoadressDetails();
                                  },
                                  child: Text(
                                    "location".tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
              ],
            )),
      )),
    );
  }
}





    //  Positioned(
    //                         bottom: 10,
    //                         left: 40,
    //                         child: Container(
    //                           padding: const EdgeInsets.all(5),
    //                           margin: const EdgeInsets.only(left: 30),
    //                           child: MaterialButton(
    //                             color: Appcolor.primarycolor,
    //                             onPressed: () {
    //                               controllerpage.gotoadressDetails();
    //                             },
    //                             child: Text(
    //                               "location".tr,
    //                               style: const TextStyle(
    //                                   fontWeight: FontWeight.bold,
    //                                   color: Colors.white,
    //                                   fontSize: 16),
    //                             ),
    //                           ),
    //                         )) 








  