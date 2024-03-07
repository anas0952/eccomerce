import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/offerse-controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/view/screen/home.dart';
import 'package:untitled/view/widget/home/coustomappbar.dart';
import 'package:untitled/view/widget/offerse/coustomitemsofferse.dart';

class Offerse extends StatelessWidget {
  const Offerse({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OfferseController());
    return GetBuilder<OfferseController>(
        builder: (controller) => ListView(
              children: [
                CoustomAppBar(
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    mycontroller: controller.search!,
                    onPressedIconFavorit: () {
                      Get.toNamed(AppRoute.myFavorite);
                    },
                    titleappbar: "home6".tr,
                    onPressedSearch: () {
                      controller.onSearchItem();
                    }),
                !controller.isSearch
                    ? HandlingDataView(
                        statusrequest: controller.statusrequest,
                        widget: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return CoustomListItemsOfferse(
                                  itemsmodel: controller.data[index],
                                  active: false);
                            }))
                    : ListSearch(dataModel: controller.datasearch)
              ],
            ));
  }
}
