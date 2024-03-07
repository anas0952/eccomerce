import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

class CoustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorit;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CoustomAppBar(
      {super.key,
      required this.titleappbar,
      required this.onPressedSearch,
      required this.onPressedIconFavorit,
      this.onChanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            controller: mycontroller,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: const Icon(Icons.search),
                ),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 20),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                filled: true,
                fillColor: Appcolor.greyTow),
          )),
          const SizedBox(
            width: 0,
          ),
          // Container(
          //     decoration: BoxDecoration(
          //         color: Colors.grey[200],
          //         borderRadius: BorderRadius.circular(10)),
          //     width: 50,
          //     padding: const EdgeInsets.symmetric(vertical: 8),
          //     child: IconButton(
          //         onPressed: onPressedIcon,
          //         icon: const Icon(
          //           Icons.notifications_active_outlined,
          //           color: Appcolor.iconColorhome,
          //           size: 30,
          //         ))),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              width: 50,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: onPressedIconFavorit,
                  icon: const Icon(
                    Icons.favorite_outline_rounded,
                    color: Appcolor.iconColorhome,
                    size: 30,
                  ))),
        ],
      ),
    );
  }
}
