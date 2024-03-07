import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/functions/translationdatabase.dart';
import 'package:untitled/data/model/categoriesmodel.dart';
import 'package:untitled/linkapi.dart';

class CoustomListCategoresitemsHome extends GetView<HomeControllerImp> {
  const CoustomListCategoresitemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 70,
                child: Categories(
                    i: index,
                    categoriesModel:
                        CategoriesModel.fromJson(controller.categories[index])),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 8,
              );
            },
            itemCount: controller.categories.length));
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoItem(
            controller.categories, i, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Appcolor.listcolor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.linkimagecategories}/${categoriesModel.categoriesImage}",
            ),
          ),
          Text(
            "${translationdatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(
              fontSize: 15.8,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
