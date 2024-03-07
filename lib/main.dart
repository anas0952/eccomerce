import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/binding/initialbinding.dart';
import 'package:untitled/core/localization/changelocale.dart';
import 'package:untitled/routes.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Localcontroler controler = Get.put(Localcontroler());

    return GetMaterialApp(
      initialBinding: InitalBinding(),
      locale: controler.Language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: controler.appthem,
      getPages: routes,
    );
  }
}
