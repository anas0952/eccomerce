import 'package:flutter/material.dart';
import 'package:untitled/core/constant/color.dart';

ThemeData themEnglish = ThemeData(
  fontFamily: "Lobster",
  useMaterial3: true,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Appcolor.secouncolor),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Appcolor.primarycolor),
    color: Colors.grey[50],
    titleTextStyle: const TextStyle(
        fontFamily: "Lobster",
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Appcolor.primarycolor),
    elevation: 0.0,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
      headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      bodyLarge: TextStyle(height: 2, color: Appcolor.grey, fontSize: 17),
      bodyMedium: TextStyle(height: 2, color: Appcolor.grey, fontSize: 15)),
);
ThemeData themarabic = ThemeData(
  fontFamily: "cairo",
  useMaterial3: true,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Appcolor.primarycolor,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
      headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      bodyLarge: TextStyle(height: 2, color: Appcolor.grey, fontSize: 15),
      bodyMedium: TextStyle(height: 2, color: Appcolor.grey, fontSize: 15)),
);
