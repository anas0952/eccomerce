import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/model/addressmode.dart';

import '../../data/datasource/remote/address-data.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  viewaddress() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await addressData.getData(
      myServices.sharedpref.getString("id")!,
    );
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        List responcedata = responce['data'];
        data.addAll(responcedata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusrequest = Statusrequest.failure;
        }
      } else {
        statusrequest = Statusrequest.none;
      }
      // End
    }
    update();
  }

  //delete
  deleteAddress(String addressid) {
    addressData.deleteData(addressid); //backend
    data.removeWhere((element) => element.addressId == addressid); //frontend
    update();
  }

  @override
  void onInit() {
    viewaddress();
    super.onInit();
  }
}
