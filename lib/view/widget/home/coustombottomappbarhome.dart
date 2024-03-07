import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/homescreencontroller.dart';

import 'coustombotonappbar.dart';

class CoustomBotomAppBarHome extends StatelessWidget {
  const CoustomBotomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          children: [
            ...List.generate(controller.listpage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CoustomButtonAppBar(
                      onPressed: () {
                        controller.changedpage(i);
                      },
                      iconButton: controller.botomappbar[i]['icon'],
                      // textButtoon: controller.botomappbar[i],
                      active: controller.currentPage == i ? true : false,
                    );
            })
          ],
        ),
      ),
    );
  }
}
