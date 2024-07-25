import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme.dart';

final _borderRadius = BorderRadius.circular(15.r);

final lightInputDecorationTheme = InputDecorationTheme(
  focusedBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: AppColors.primary, width: 1),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: AppColors.danger, width: 1),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: AppColors.danger, width: 1),
  ),
  errorMaxLines: 2,
  border: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(color: AppColors.gray.shade300, width: 1),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(color: AppColors.gray.shade300, width: 1),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(color: AppColors.gray.shade200, width: 1),
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  floatingLabelStyle: titleLarge.copyWith(color: AppColors.primary),
  errorStyle: bodySmall.copyWith(color: AppColors.danger),
  labelStyle: labelSmall.copyWith(color: AppColors.gray.shade400),
  hintStyle: titleMedium.copyWith(color: AppColors.gray.shade400),
);

final darkInputDecorationTheme = lightInputDecorationTheme.copyWith(
  floatingLabelStyle: lightInputDecorationTheme.floatingLabelStyle
      ?.copyWith(color: AppColors.white),
  enabledBorder: lightInputDecorationTheme.enabledBorder?.copyWith(
    borderSide: lightInputDecorationTheme.enabledBorder?.borderSide
        .copyWith(color: AppColors.gray.shade700),
  ),
  border: lightInputDecorationTheme.border?.copyWith(
    borderSide: lightInputDecorationTheme.border?.borderSide
        .copyWith(color: AppColors.gray.shade700),
  ),
  disabledBorder: lightInputDecorationTheme.disabledBorder?.copyWith(
    borderSide: lightInputDecorationTheme.disabledBorder?.borderSide
        .copyWith(color: AppColors.gray.shade500),
  ),
);
