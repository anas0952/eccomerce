import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/data/model/itemsmodel.dart';
import 'package:untitled/linkapi.dart';
import 'package:untitled/view/widget/home/coustomappbar.dart';
import 'package:untitled/view/widget/home/coustomcardhome.dart';
import 'package:untitled/view/widget/home/coustomlistcategories.dart';
import 'package:untitled/view/widget/home/coustomlistitems-home.dart';
import 'package:untitled/view/widget/home/coustomlistofferse.dart';
import 'package:untitled/view/widget/home/coustomtitlehome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
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
                HandlingDataView(
                    statusrequest: controller.statusrequest,
                    widget: controller.isSearch
                        ? ListSearch(dataModel: controller.datasearch)
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CoustomCardHome(
                                body: controller.body,
                                title: controller.title,
                                text: controller.text,
                              ),
                              CoustomTitleHome(title: "home3".tr),
                              const CoustomListCategoresitemsHome(),
                              CoustomTitleHome(title: "home4".tr),
                              const CoustomListItemsHome(),
                              CoustomTitleHome(title: "home5".tr),
                              const CoustomListItemsOfferse()
                            ],
                          ))
              ],
            )));
  }
}

class ListSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> dataModel;
  const ListSearch({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataModel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {
            controller.getdetalisitems(dataModel[index]);
          },
          child: Container(
            color: Colors.white,
            height: 140,
            margin: const EdgeInsets.only(top: 11),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.linkimageitems}/${dataModel[index].itemsImage}")),
                Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(dataModel[index].itemsName!),
                      subtitle: Text(
                        "Count: ${dataModel[index].itemsCount!}",
                        style: const TextStyle(
                            fontSize: 22, color: Colors.deepOrange),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
