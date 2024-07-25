import 'package:speech_to_text_app/core/theme/theme.dart';
import 'package:flutter/material.dart';

final sliderTheme = SliderThemeData(
  overlayShape: SliderComponentShape.noOverlay,
  trackHeight: 8,
  activeTrackColor: AppColors.blue,
  inactiveTrackColor: Colors.grey.shade300,
  thumbColor: AppColors.blue,
);

final darkSliderTheme = sliderTheme.copyWith(
  valueIndicatorTextStyle: bodySmall.copyWith(color: Colors.white),
);
