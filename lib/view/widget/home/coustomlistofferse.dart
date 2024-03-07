import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/functions/translationdatabase.dart';
import 'package:untitled/data/model/itemsmodel.dart';
import 'package:untitled/linkapi.dart';

class CoustomListItemsHome extends GetView<HomeControllerImp> {
  const CoustomListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsmodel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsmodel;
  const ItemsHome({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.getdetalisitems(itemsmodel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.all(10),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.linkimageitems}/${itemsmodel.itemsImage}",
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 160,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Appcolor.black.withOpacity(0.2)),
          ),
          Positioned(
              left: 6,
              top: 115,
              child: Text(
                "${translationdatabase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
                style: const TextStyle(
                    color: Appcolor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
