import 'package:flutter/material.dart';
import 'package:untitled/core/constant/imageAsset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppimageAsset.logo,
      height: 200,
    );
  }
}
