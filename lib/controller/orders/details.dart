import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/data/datasource/remote/orders/details.dart';
import 'package:untitled/data/model/cartmodel.dart';
import 'package:untitled/data/model/ordersmodel.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  //varible map
  Position? position;
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? cameraPosition;
  double? lat;
  double? long;
  List<Marker> makers = [];
  //varible end
  late Statusrequest statusrequest;
  OrdersDetailsData ordersDetailsData = Get.put(OrdersDetailsData(Get.find()));
  List<CartModel> data = [];
  initaldata() {
    ordersModel = Get.arguments['ordersmodel'];
    if (ordersModel.ordersType == "0") {
      lat = double.parse(ordersModel.addressLat!);
      long = double.parse(ordersModel.addressLong!);
      cameraPosition = CameraPosition(
        target: LatLng(lat!, long!),
        zoom: 18.4746,
      );
      completercontroller = Completer<GoogleMapController>();
      makers.add(
          const Marker(markerId: MarkerId("1"), position: LatLng(22.2, 21.55)));
    }
  }

  getdata() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce =
        await ordersDetailsData.getData(ordersid: ordersModel.ordersId!);
    statusrequest = hanglingdata(responce);
    print(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        List listdata = responce['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.none;
      }
    }
    update();
  }

  @override
  void onInit() {
    initaldata();
    getdata();
    super.onInit();
  }
}
