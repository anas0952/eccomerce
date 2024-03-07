import 'package:get/get.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/handlingdata_controller.dart';
import 'package:untitled/core/services/services.dart';
import 'package:untitled/data/datasource/remote/notification/notificationdata.dart';
import 'package:untitled/data/model/notificationmodel.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List data = [];
  List<NotificationModel> dataremove = [];

  late Statusrequest statusrequest;
  MyServices myServices = Get.find();

  getdata() async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await notificationData.getDataNotify(
        usersid: myServices.sharedpref.getString("id")!);
    statusrequest = hanglingdata(responce);
    print(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        List data = responce['data'];
        dataremove.addAll(data.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  deletdataNotify(id) async {
    statusrequest = Statusrequest.lodaing;
    update();
    var responce = await notificationData.deletedatanotify(id: id);
    statusrequest = hanglingdata(responce);
    if (Statusrequest.success == statusrequest) {
      if (responce['status'] == "success") {
        dataremove.removeWhere((element) => element.notificatoinId == id);
      }
    }
  }
}
