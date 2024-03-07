import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:untitled/controller/orders/pindingcontroller.dart';

requestpermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

firebasecloudmessage() {
  FirebaseMessaging.onMessage.listen((message) {
    print("====================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, "${message.notification!.body}");
    refreashpagepinding(message.data);
  });
}

refreashpagepinding(data) {
  print("==================================================pageid");
  print(data['pageid']);
  print("==================================================pagename");
  print(data['pagename']);
  print(Get.currentRoute);
  if (Get.currentRoute == "/orderspinding" &&
      data['pagename'] == "refreashorderpage") {
    OrderPindingController orderPindingController = Get.find();
    orderPindingController.refreashorderpinding();
  }
}
