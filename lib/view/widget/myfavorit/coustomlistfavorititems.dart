import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/myfavorite-controller.dart';
import 'package:untitled/core/functions/translationdatabase.dart';
import 'package:untitled/data/model/myfavorite.dart';
import 'package:untitled/linkapi.dart';

import '../../../core/constant/color.dart';

class CoustomListItemsFavorite extends GetView<MyFavoritcontrollerImp> {
  final MyFavoriteModel itemsmodel;
  const CoustomListItemsFavorite({
    super.key,
    required this.itemsmodel,
  });
  @override
  Widget build(BuildContext context) {
    MyFavoritcontrollerImp controller = Get.put(MyFavoritcontrollerImp());

    return InkWell(
      onTap: () {
        // controller.getdetalisitems(itemsmodel);
      },
      child: Card(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 170,
                child: Hero(
                  tag: "${itemsmodel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.linkimageitems}/${itemsmodel.itemsImage}",
                    fit: BoxFit.fitHeight,
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
            Row(
              children: [
                const Expanded(child: Text("Rating 3.5")),
                ...List.generate(
                    5,
                    (index) => const Icon(
                          Icons.star,
                          size: 20,
                        ))
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(
                "${itemsmodel.itemsPrice}" "\t" "\$",
                style: const TextStyle(
                    fontSize: 23,
                    color: Appcolor.secouncolor,
                    fontFamily: "sans"),
              ),
              IconButton(
                  onPressed: () {
                    controller.deletfromfavirote(itemsmodel.favoriteId!);
                  },
                  icon: const Icon(Icons.delete_outline))
            ])
          ],
        ),
      ),
    );
  }
}
