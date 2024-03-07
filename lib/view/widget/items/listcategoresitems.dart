import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/itemscontroller.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/functions/translationdatabase.dart';
import 'package:untitled/data/model/categoriesmodel.dart';

class CoustomListCategoresitems extends GetView<ItemControllerImp> {
  const CoustomListCategoresitems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    return SizedBox(
        height: 80,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Categories(
                  i: index,
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categores[index]));
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 8,
              );
            },
            itemCount: controller.categores.length));
  }
}

class Categories extends GetView<ItemControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    return GetBuilder<ItemControllerImp>(
        builder: (controller) => InkWell(
              onTap: () {
                controller.changcat(i, categoriesModel.categoriesId!);
              },
              child: Column(
                children: [
                  Container(
                    decoration: controller.selectcat == i
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    // color: Appcolor.greyTow,
                                    width: 0.7,
                                    style: BorderStyle.solid)))
                        : null,
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Text(
                      "${translationdatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                      style:
                          const TextStyle(fontSize: 22, color: Appcolor.black),
                    ),
                  )
                ],
              ),
            ));
  }
}
