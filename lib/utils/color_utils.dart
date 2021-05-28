import 'package:flutter/material.dart';

class ColorUtils {
  static const transparent = Color(0x00000000);
  static const blue1 =  Color(0xFF4267B2);
  static const blueAccent =  Color(0xFF29ABE2);
  static const bgGreen =  Color(0xFFE4F7FF);
  static const blueAccent29 =  Color(0x1D29ABE2);
  static const LIGHT_GREEN =  Color(0xFF34D182);
  static const LIGHT_GREEN_BORDER =  Color(0xFFA8FFD3);
  static const BG_LIGHT_GREEN =  Color(0x1834D182);
  static const BLACK_BACKGROUND =  Color(0xB9585858);
  static const red1 =  Color(0xFFCC3333);
  static const gray1 =  Color(0xFFB4B4B4);
  static const gray2 =  Color(0xFF444444);
  static const gray3 =  Color(0xFF848484);
  static const gray4 =  Color(0xFFE8E8E8);
  static const gray5 =  Color(0xFFE1E0E8);
  static const gray6 =  Color(0xFFD5D5D5);
  static const gray7 =  Color(0xFFE3E3E3);
  static const gray8 =  Color(0xFF8E8E93);
  static const backgroundColor = Color(0xFFF2F2F2);
  static const backgroundGrayLight = Color(0xFFF3F3F3);
  static const backgroundBoldColor = Color(0xFFEEEEEE);
  static const DEFAULT_AVATAR_COLOR = [Color(0xFFF29496),Color(0xFFF294E8),Color(0xFFAD96F8),Color(0xFF96B4F9),Color(0xFF91E5FC),Color(0xFF7FE292),Color(0xFF20C9FF)];

  static const MAIN_GRADIENT_1 = Color(0xFF048DDC);
  static const MAIN_GRADIENT_2 = Color(0xFF20C9FF);
  static const TEXT_LIGHT = Color(0xFF848484);
  static const TEXT_NORMAL = Color(0xFF444444);
  static const TEXT_BOLD = Color(0xFF181818);
  static const TEXT_PRODUCT_NAME = Color(0xFF262626);
  static const HINT_COLOR = Color(0xFFB4B4B4);
  static const SALE_PRICE_COLOR = Color(0xFFF2C642);
  static const BG_BTN_EDIT = Color(0x1729ABE2);
  static const RED_LIGHT = Color(0xFFF6496A);
  static const RED_BACKGROUND = Color(0xFFEA4851);
  static const LIGHT_GREEN_SMALL = Color(0xFFE9FFF4);
  static const RED_TEXT = Color(0xFFFF4F59);
  static const BROWN_TEXT = Color(0xFF616161);
  static const YELLOW_TEXT = Color(0xFFFFBF00);
  static const APPBAR_GRADIENT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ColorUtils.MAIN_GRADIENT_1,
      ColorUtils.MAIN_GRADIENT_2
  ]);
  static const PROGRESSCOLOR = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        ColorUtils.MAIN_GRADIENT_1,
        ColorUtils.MAIN_GRADIENT_2
      ]);
  static const PROGRESSCOLOR_EXERCISE_WORKOUT = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff72DF80),
        Color(0xff3ECE9C),
      ]);
}