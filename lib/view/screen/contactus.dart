import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/contactus-controller.dart';
import 'package:untitled/core/class/handlingdataview.dart';
import 'package:untitled/core/constant/color.dart';
import 'package:untitled/view/widget/cart/bottonorder.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    ContactUsController controller = Get.put(ContactUsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Form(
          key: controller.formstate,
          child: GetBuilder<ContactUsController>(
              builder: (controller) => HandlingDataView(
                    statusrequest: controller.statusrequest,
                    widget: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controller.title,
                            decoration: const InputDecoration(
                                isDense: true,
                                suffixIcon: Icon(Icons.person),
                                label: Text("First Name"),
                                hintStyle: TextStyle(
                                    color: Appcolor.secouncolor, fontSize: 20),
                                labelStyle: TextStyle(
                                    color: Appcolor.colorsHometow,
                                    fontSize: 20),
                                iconColor: Appcolor.colorsHometow,
                                alignLabelWithHint: true,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ////////////////////////////////////////////////////////near_me_rounded
                          TextFormField(
                            controller: controller.number,
                            decoration: const InputDecoration(
                                isDense: true,
                                suffixIcon: Icon(Icons.call),
                                label: Text("Phone Number "),
                                hintStyle: TextStyle(
                                    color: Appcolor.secouncolor, fontSize: 20),
                                labelStyle: TextStyle(
                                    color: Appcolor.colorsHometow,
                                    fontSize: 20),
                                iconColor: Appcolor.colorsHometow,
                                alignLabelWithHint: true,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: controller.body,
                            decoration: const InputDecoration(
                                isDense: true,
                                suffixIcon: Icon(Icons.near_me_rounded),
                                label: Text("Subject of communication"),
                                hintStyle: TextStyle(
                                    color: Appcolor.secouncolor, fontSize: 20),
                                labelStyle: TextStyle(
                                    color: Appcolor.colorsHometow,
                                    fontSize: 20),
                                iconColor: Appcolor.colorsHometow,
                                alignLabelWithHint: true,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CoustomButtonCart(
                              textbutton: "Send",
                              onPressed: () {
                                controller.signUp();
                              })
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
