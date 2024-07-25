import 'package:speech_to_text_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'elevated_button_style.dart';
part 'outlined_button_style.dart';
part 'text_button_style.dart';
part 'icon_button_style.dart';

mixin LargeButtonMixin on BaseButtonStyle {
  double get defaultHeight => 60.h;

  @override
  MaterialStateProperty<TextStyle?>? get textStyle =>
      MaterialStatePropertyAll(titleSmall.copyWith(
        fontWeight: FontWeight.w800,
      ));
}

mixin MediumButtonMixin on BaseButtonStyle {
  double get defaultHeight => 42.h;

  @override
  MaterialStateProperty<TextStyle?>? get textStyle =>
      MaterialStatePropertyAll(titleMedium);
}

mixin SmallButtonMixin on BaseButtonStyle {
  double get defaultHeight => 32.h;

  @override
  MaterialStateProperty<TextStyle?>? get textStyle =>
      MaterialStatePropertyAll(bodySmall.copyWith(fontWeight: FontWeight.w600));
}

abstract class BaseButtonStyle extends ButtonStyle {
  const BaseButtonStyle({
    this.nonMaterialBackgroundColor = AppColors.primary,
    this.nonMaterialForegroundColor = AppColors.white,
    this.isFullWidth = true,
  }) : super();

  final Color nonMaterialBackgroundColor;
  final Color nonMaterialForegroundColor;
  final bool isFullWidth;

  double get width => isFullWidth ? double.infinity : 0.0;

  @override
  MaterialStateProperty<OutlinedBorder?>? get shape => MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
      );

  @override
  MaterialStateProperty<EdgeInsetsGeometry?>? get padding =>
      MaterialStatePropertyAll(EdgeInsets.symmetric(
        horizontal: 16.w,
      ));
}
