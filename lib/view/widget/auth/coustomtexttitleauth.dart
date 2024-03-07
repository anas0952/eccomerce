import 'package:flutter/material.dart';

class CoustomtextTitleAuth extends StatelessWidget {
  final String text;
  const CoustomtextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
