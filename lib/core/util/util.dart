import 'package:flutter/material.dart';

class Util {

  static Color colorWithHexString(String hexString) {

    // 将hexString转为16进制
    final colorInt = int.parse(hexString, radix: 16);
    // 将透明度加上
    Color color = Color(colorInt| 0xFF000000);

    return color;
  }

}