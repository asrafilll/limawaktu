import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle h2TextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Color(0XFFF2F2F2),
  );

  static TextStyle smallBodyTextStyle = const TextStyle(
    fontSize: 12,
    color: Color(0XFF535353),
  );

  static TextStyle prayTimeTextStyle = const TextStyle(
    fontSize: 16,
    color: AppColors.kblackTextColor,
  );
}

class AppColors {
  static const kLightBlueColor = Color(0XFF6378F7);
  static const kblackTextColor = Color(0XFF0F0F0F);
}
