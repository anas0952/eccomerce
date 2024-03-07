import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/linkapi.dart';

class CoustomCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onadd;
  final void Function()? ondelete;

  const CoustomCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagename,
      required this.onadd,
      required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.linkimageitems}/$imagename",
                height: 100,
                fit: BoxFit.cover,
              )),
          Expanded(
              flex: 4,
              child: ListTile(
                title: Text(name),
                subtitle: Text(
                  "$price  \$",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 148, 148, 148), fontSize: 23),
                ),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                  height: 35,
                  child: IconButton(
                      onPressed: onadd, icon: const Icon(Icons.add))),
              SizedBox(
                  height: 30,
                  child: Text(
                    count,
                    style: const TextStyle(fontFamily: "sans"),
                  )),
              SizedBox(
                height: 25,
                child: IconButton(
                    onPressed: ondelete, icon: const Icon(Icons.remove)),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
