import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/settings_controller.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/constant/imageAsset.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: Get.width / 3,
                    color: Appcolor.primarycolor),
                Positioned(
                    top: Get.width / 3.5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Appcolor.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Color.fromARGB(235, 245, 245, 245),
                        backgroundImage: AssetImage(AppimageAsset.avatar),
                      ),
                    )),
              ]),
          const SizedBox(
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ListTile(
                  //     onTap: () {},
                  //     title: const Text("Disable Notification"),
                  //     trailing: Switch(

                  //       value: false,
                  //       onChanged: (val) {},
                  //     )),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    title: const Text("Address"),
                    trailing: const Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.orderspinding);
                    },
                    title: const Text("Order Pinding"),
                    trailing: const Icon(Icons.padding),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersarchive);
                    },
                    title: const Text("Order Archive"),
                    trailing: const Icon(Icons.archive),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("About us"),
                    trailing: const Icon(Icons.help_outline_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.toNamed(AppRoute.contactus);
                      launchUrl(Uri.parse("tel:+994842403"));
                    },
                    title: const Text("Contact us"),
                    trailing: const Icon(Icons.call),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.exit_to_app),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
