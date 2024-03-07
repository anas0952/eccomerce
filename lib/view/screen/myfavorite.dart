import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/controller/myfavorite-controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/data/model/itemsmodel.dart';
import 'package:untitled/linkapi.dart';
import 'package:untitled/view/widget/home/coustomappbar.dart';
import 'package:untitled/view/widget/myfavorit/coustomlistfavorititems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritcontrollerImp());
    HomeControllerImp();
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GetBuilder<MyFavoritcontrollerImp>(
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
                  HandlingDataView(
                      statusrequest: controller.statusrequest,
                      widget: controller.isSearch
                          ? ListSearch(dataModel: controller.datasearch)
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 0.6),
                              itemBuilder: (context, index) {
                                return CoustomListItemsFavorite(
                                    itemsmodel: controller.data[index]);
                              }))
                ],
              ),
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
          child: Card(
            child: Container(
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
      ),
    );
  }
}
