import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/itemsdetails.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/linkapi.dart';

class TopPageDetails extends GetView<ItemsDetailsControllerImp> {
  const TopPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return HandlingDataView(
        statusrequest: controller.statusrequest,
        widget: GetBuilder<ItemsDetailsControllerImp>(
            builder: (controller) => Stack(clipBehavior: Clip.none, children: [
                  Container(
                      height: 300,
                      decoration: const BoxDecoration(color: Appcolor.white)),
                  Positioned(
                      top: 50.0,
                      right: Get.width / 6,
                      left: Get.width / 6,
                      child: Hero(
                          tag: "${controller.itemsmodel.itemsId}",
                          child: SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: controller.image.isEmpty
                                  ? CachedNetworkImage(
                                      height: 400,
                                      imageUrl:
                                          "${AppLink.linkimageitems}/${controller.itemsmodel.itemsImage}",
                                    )
                                  : Stack(children: [
                                      PageView.builder(
                                        onPageChanged: (index) {
                                          controller.pagenew(index);
                                        },
                                        physics: const BouncingScrollPhysics(),
                                        controller: controller.pc,
                                        itemCount: controller.image.length,
                                        itemBuilder: (context, index) =>
                                            SizedBox(
                                          height: 400,
                                          width: double.infinity,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "${AppLink.linkimageitems}/${controller.image[index]['itemsimages_name']}",
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 210,
                                          left: 225,
                                          child: IconButton(
                                              onPressed: () {
                                                controller.pc!.animateToPage(
                                                    controller.indexpage,
                                                    duration: const Duration(
                                                        seconds: 3),
                                                    curve:
                                                        Curves.easeInOutQuint);
                                              },
                                              icon: const Icon(
                                                Icons.arrow_forward_sharp,
                                                size: 30,
                                              )))
                                    ]))))
                ])));
  }
}
