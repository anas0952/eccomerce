import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/routes.dart';

abstract class AddAddressController extends GetxController {}

class AddAddressControllerImp extends AddAddressController {
  //varible
  Position? position;
  Completer<GoogleMapController>? complitercontroller;
  CameraPosition? kGooglePlex;
  Statusrequest statusrequest = Statusrequest.lodaing;
  List<Marker> marker = [];
  double? lat;
  double? long;

  //end
  // starts on initial

  addmarker(LatLng latLng) {
    marker.clear();
    marker.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  void onInit() {
    getcurrentLocation();
    complitercontroller = Completer<GoogleMapController>();
    super.onInit();
  }

  //end
  //method
  getcurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addmarker(LatLng(position!.latitude, position!.longitude));
    statusrequest = Statusrequest.none;
    update();
  }

  gotoadressDetails() {
    Get.toNamed(AppRoute.addressaddDetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }
}
