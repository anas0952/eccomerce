import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

class PriceAndCountItem extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onremove;
  final String price;
  final String count;
  const PriceAndCountItem(
      {super.key,
      required this.onAdd,
      required this.onremove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$price \$',
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(20)),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add, size: 25, color: Appcolor.grey),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(count),
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(20)),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: onremove,
              icon: const Icon(Icons.remove, size: 25, color: Appcolor.grey),
            ),
          ),
        ),
      ],
    );
  }
}
