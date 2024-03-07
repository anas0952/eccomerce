import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/favorit-data.dart';

abstract class Favoritecontroller extends GetxController {
  setvaForite(id, val);
  addFavorit(String usersid, String itemsid);
  removeFavorit(String usersid, String itemsid);
}

class FavoritecontrollerImp extends Favoritecontroller {
  Map isfavorite = {};
  late Statusrequest statusrequest;
  FavoritData favoritData = FavoritData(Get.find());
  MyServices myServices = Get.find();

  @override
  setvaForite(id, val) {
    isfavorite[id] = val;
    update();
  }

  @override
  addFavorit(usersid, itemsid) async {
    statusrequest = Statusrequest.lodaing;
    var responce = await favoritData.addFavorit(
        myServices.sharedpref.getString("id")!, itemsid);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  removeFavorit(usersid, itemsid) async {
    statusrequest = Statusrequest.lodaing;
    var responce = await favoritData.addFavorit(
        myServices.sharedpref.getString("id")!, itemsid);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        Get.snackbar(
          'Snackbar',
          'This is a snackbar',
          snackPosition: SnackPosition.BOTTOM,
          // forwardAnimationCurve: Curves.elasticInOut,
          // reverseAnimationCurve: Curves.easeOut,
        );
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }
}
