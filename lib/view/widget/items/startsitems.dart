// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:untitled/controller/itemscontroller.dart';

// class StarsItems extends StatelessWidget {
//   const StarsItems({super.key});
//   @override
//   Widget build(BuildContext context) {
//     ItemControllerImp controller = Get.put(ItemControllerImp());
//     return GetBuilder<ItemControllerImp>(
//         builder: (controller) => RatingBar.builder(
//               initialRating: 3,
//               minRating: 1,
//               itemSize: 25,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//               itemBuilder: (context, _) => const Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 controller.getItemsstars(rating );
//               },
//             ));
//   }
// }
