import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'styles/root.dart';

import 'app_colors.dart';
export 'app_colors.dart';

part 'typography.dart';

final theme = ThemeData.light(useMaterial3: true).copyWith(
  primaryColor: colorScheme.primary,
  shadowColor: colorScheme.shadow,
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.background,
  textTheme: textTheme,
  elevatedButtonTheme: elevatedButtonThemeData,
  outlinedButtonTheme: outlinedButtonTheme,
  textButtonTheme: textButtonThemeData,
  iconButtonTheme: iconButtonThemeData,
  inputDecorationTheme: lightInputDecorationTheme,
  appBarTheme: appBarTheme,
  progressIndicatorTheme: progressIndicatorThemeData,
  sliderTheme: sliderTheme,
  cardTheme: cardTheme,
);
