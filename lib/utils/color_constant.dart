import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black = fromHex('#000000');

  static Color white = fromHex('#ffffff');

  static Color primary = fromHex('#98272B');

  static Color color_f3f1e9 = fromHex('#ffffffcc');

  static Color color_e6e6e6 = fromHex('#e6e6e6');

  static Color color_9c9ca4 = fromHex('#9c9ca4');

  static Color color_b2c0ff = fromHex('#b2c0ff');

  static Color color_AAB0B4 = fromHex('#AAB0B4');

  static Color color_E6E8EB = fromHex('#E6E8EB');

  static Color color_F4F5F9 = fromHex('#F4F5F9');

  static Color color_616264 = fromHex('#616264');

  static Color color_F5F5F7 = fromHex('#F5F5F7');

  static Color color_EBEBEB = fromHex('#EBEBEB');

  static Color color_222020 = fromHex('#222020');

  static Color color_F6F6F6 = fromHex('#F6F6F6');

  static Color color_0057FF = fromHex('#0057FF');

  static Color color_cccccc = fromHex('#cccccc');

  static Color color_FDA946 = fromHex('#FDA946');

  static Color color_6FC32D = fromHex('#6FC32D');

  static Color color_FA1C1C = fromHex('#FA1C1C');

  static Color color_98272B = fromHex('#98272B');

  static Color color_D0D3D8 = fromHex('#D0D3D8');

  static Color color_F9F9F9 = fromHex('#F9F9F9');

  static Color color_081013 = fromHex('#081013');

  static Color color_56AE59 = fromHex('#56AE59');

  static Color color_DA7537 = fromHex('#DA7537');

  static Color color_C0C0C0 = fromHex('#C0C0C0');

  static Color color_FF98272B = fromHex('#FF98272B');

  static Color color_8c8c8c = fromHex('#8c8c8c');

  static Color color_0090FF = fromHex('#0090FF');

  static Color color_E8B447 = fromHex('#E8B447');

  static Color tColor_E8B447 = fromHex('#E8B447');

  static Color color_81FD04 = fromHex('#81FD04');

  static Color color_858585 = fromHex('#858585');

  static Color color_AA7C2C = fromHex('#AA7C2C');

  static Color color_CEA346 = fromHex('#CEA346');

  static Color color_EEC467 = fromHex('#EEC467');

  static Color color_8F6019 = fromHex('#8F6019');

  static Color color_473000 = fromHex('#473000');

  static Color color_3F2A00 = fromHex('#3F2A00');

  static Color color_271B00 = fromHex('#271B00');

  static Color color_020100 = fromHex('#020100');

  static Color color_323232 = fromHex('#323232');

  static Color color_49B2FF = fromHex('#49B2FF');

  static Color color_F08080 = fromHex('#F08080');

  static Color color_D5D4DF = fromHex('#D5D4DF');

  static Color color_32CD32 = fromHex('#32CD32');

  static const Color backgroundColor = Colors.black;

  static const Color mainColor = Color.fromRGBO(232, 180, 71, 1);

  static const Color appbarColor = Color.fromRGBO(71, 48, 0, 1);

  static const Color unSelectedTextColor = Color(0xffc9c9c9);

  static const Color materialButtonColor = Color(0xfffa2f65);

  static const Color greenColor = Color.fromRGBO(129, 253, 4, 1);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
