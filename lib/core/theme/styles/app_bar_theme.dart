import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

final appBarTheme = AppBarTheme(
  titleTextStyle: textTheme.titleMedium?.copyWith(color: AppColors.white),
  backgroundColor: AppColors.blue,
  iconTheme: const IconThemeData(color: AppColors.black),
  actionsIconTheme: const IconThemeData(color: AppColors.black),
  elevation: 0,
  surfaceTintColor: AppColors.black,
  centerTitle: true,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
);
