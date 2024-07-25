import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

final cardTheme = CardTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
    side: BorderSide(
      width: 0.6,
      color: AppColors.gray.shade200,
    ),
  ),
  color: AppColors.white,
  clipBehavior: Clip.hardEdge,
  margin: EdgeInsets.zero,
);

final darkCardTheme = cardTheme.copyWith(
  color: AppColors.gray.shade700,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
    side: BorderSide(
      width: 0.6,
      color: AppColors.gray.shade900,
    ),
  ),
);
