import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/favorite-controller.dart';
import 'package:untitled/controller/itemscontroller.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/core/constant/imageAsset.dart';
import 'package:untitled/core/functions/translationdatabase.dart';
import 'package:untitled/data/model/itemsmodel.dart';
import 'package:untitled/linkapi.dart';

class CoustomListItems extends GetView<ItemControllerImp> {
  final ItemsModel itemsmodel;
  final bool active;
  const CoustomListItems(
      {super.key, required this.itemsmodel, required this.active});
  @override
  Widget build(BuildContext context) {
    ItemControllerImp controller = Get.put(ItemControllerImp());
    FavoritecontrollerImp controllervaf = Get.put(FavoritecontrollerImp());

    return InkWell(
        onTap: () {
          controller.getdetalisitems(itemsmodel);
        },
        child: itemsmodel.itemsActive == "1"
            ? Card(
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 180,
                              child: Hero(
                                tag: "${itemsmodel.itemsId}",
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.linkimageitems}/${itemsmodel.itemsImage}",
                                  // fit: BoxFit.fitHeight,
                                ),
                              )),
                          Text(
                            "${translationdatabase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          /////////////////////////////////////////////
                          // GetBuilder<ItemControllerImp>(
                          //     builder: (controller) => RatingBar.builder(
                          //           initialRating: controller.starsnumber,
                          //           minRating: 1,
                          //           itemSize: 25,
                          //           direction: Axis.horizontal,
                          //           allowHalfRating: true,
                          //           itemCount: 5,
                          //           itemPadding:
                          //               const EdgeInsets.symmetric(horizontal: 4.0),
                          //           itemBuilder: (context, _) => const Icon(
                          //             Icons.star,
                          //             color: Colors.amber,
                          //           ),
                          //           onRatingUpdate: (rating) {
                          //             controller.getItemsstars(
                          //                 itemsmodel.itemsId!, rating);
                          //           },
                          //         ))
                          /////////////////////////////////////////////

                          // Row(
                          //   children: [
                          //     const Expanded(child: Text("Rating 3.5")),
                          //     ...List.generate(
                          //         5,
                          //         (index) => const Icon(
                          //               Icons.star,
                          //               size: 20,
                          //             ))
                          //   ],
                          // ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if (itemsmodel.itemsDiscount != "0")
                                  Text(
                                    "${itemsmodel.itemsPrice}" "\t" "\$",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.lineThrough,
                                        fontFamily: "sans",
                                        color: Appcolor.secouncolor),
                                  ),
                                Text(
                                  "${itemsmodel.itemsdescount}" "\t" "\$",
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontFamily: "sans",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ])
                        ],
                      ),
                      if (itemsmodel.itemsDiscount != "0")
                        Image.asset(
                          AppimageAsset.sale,
                          width: 45,
                        ),
                      //favirote =>
                      Positioned(
                          left: 125,
                          top: 3,
                          child: CircleAvatar(
                              backgroundColor: Colors.grey[50],
                              radius: 20,
                              child: GetBuilder<FavoritecontrollerImp>(
                                  builder: (controller) => IconButton(
                                        onPressed: () {
                                          if (controller.isfavorite[
                                                  itemsmodel.itemsId] ==
                                              "1") {
                                            controller.setvaForite(
                                                itemsmodel.itemsId, "0");
                                            controllervaf.favoritData
                                                .removeFavorit(
                                                    myServices.sharedpref
                                                        .getString("id")!,
                                                    itemsmodel.itemsId!);
                                          } else {
                                            controller.setvaForite(
                                                itemsmodel.itemsId, "1");
                                            controllervaf.favoritData
                                                .addFavorit(
                                                    myServices.sharedpref
                                                        .getString("id")!,
                                                    itemsmodel.itemsId!);
                                          }
                                        },
                                        icon: controller.isfavorite[
                                                    itemsmodel.itemsId] ==
                                                "1"
                                            ? const Icon(Icons.favorite)
                                            : const Icon(
                                                Icons.favorite_border_outlined),
                                        color: Colors.red,
                                      ))))
                    ],
                  ),
                ),
              )
            : Container());
  }
}
