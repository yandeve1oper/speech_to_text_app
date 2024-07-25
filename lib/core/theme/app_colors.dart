import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const purple = Color(0xff313981);
  static const blue = Color(0xff2961ff);
  static const aquamarine = Color(0xff0ccdd2);
  static const black = Colors.black;
  static const white = Colors.white;

  static const primary = purple;
  static const danger = MaterialColor(0xffd93c3d, {
    100: Color(0xfffff2f2),
    200: Color(0xffffd6d9),
    300: Color(0xffffa8b4),
    500: Color(0xffd93c3d),
  });
  static const warning = MaterialColor(0xffff8900, {
    100: Color(0xfffff1e0),
    200: Color(0xffffd5a4),
    300: Color(0xffffb45e),
    500: Color(0xffff8900),
  });
  static final success = MaterialColor(aquamarine.value, const {
    300: Color.fromARGB(255, 174, 229, 203),
    500: aquamarine,
    700: Color.fromARGB(255, 46, 201, 129),
    900: Color.fromARGB(255, 21, 161, 96),
  });
  static const gray = MaterialColor(0xff667085, {
    50: Color(0xfff9fafa),
    100: Color(0xfff2f4f7),
    200: Color(0xffeaecf0),
    300: Color(0xffd0d5dd),
    400: Color(0xff98a2b3),
    500: Color(0xff667085),
    600: Color(0xff475467),
    700: Color(0xff2e3a59),
    800: Color(0xff1d2939),
    900: Color(0xff101828),
  });
  static const backgroundColor = Colors.white;
  static const google = Color(0xffe64034);
  static const apple = Color(0xff000000);
}

final colorScheme = ColorScheme.light(
  brightness: Brightness.light,
  primary: AppColors.primary,
  tertiary: AppColors.gray.shade200,
  background: AppColors.backgroundColor,
  shadow: AppColors.gray.shade300,
  surface: AppColors.white,
  onSurface: AppColors.gray.shade700,
);
