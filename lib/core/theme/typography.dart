part of 'theme.dart';

const defaultFontFamily = 'Manrope';

final _baseTextStyle = TextStyle(
  fontFamily: defaultFontFamily,
  fontWeight: FontWeight.normal,
  color: AppColors.gray.shade900,
  letterSpacing: 0,
);
final _boldTextStyle = _baseTextStyle.copyWith(fontWeight: FontWeight.w700);

final displayLarge = _boldTextStyle.copyWith(fontSize: 38.sp);
final displayMedium = _boldTextStyle.copyWith(fontSize: 34.sp);
final displaySmall = _boldTextStyle.copyWith(fontSize: 32.sp);
final headlineLarge = _boldTextStyle.copyWith(fontSize: 28.sp);
final headlineMedium = _boldTextStyle.copyWith(fontSize: 24.sp);
final headlineSmall = _boldTextStyle.copyWith(fontSize: 22.sp);
final titleLarge = _boldTextStyle.copyWith(fontSize: 18.sp);
final titleMedium = _boldTextStyle.copyWith(fontSize: 16.sp);
final titleSmall = _boldTextStyle.copyWith(fontSize: 14.sp);
final bodyLarge = _baseTextStyle.copyWith(fontSize: 16.sp);
final bodyMedium = _baseTextStyle.copyWith(fontSize: 14.sp);
final bodySmall = _baseTextStyle.copyWith(fontSize: 12.sp);
final labelLarge = _baseTextStyle.copyWith(fontSize: 16.sp);
final labelMedium = _baseTextStyle.copyWith(fontSize: 14.sp);
final labelSmall = _boldTextStyle.copyWith(fontSize: 12.sp);

final textTheme = TextTheme(
  displayLarge: displayLarge,
  displayMedium: displayMedium,
  displaySmall: displaySmall,
  headlineLarge: headlineLarge,
  headlineMedium: headlineMedium,
  headlineSmall: headlineSmall,
  titleLarge: titleLarge,
  titleMedium: titleMedium,
  titleSmall: titleSmall,
  bodyLarge: bodyLarge,
  bodyMedium: bodyMedium,
  bodySmall: bodySmall,
  labelLarge: labelLarge,
  labelMedium: labelMedium,
  labelSmall: labelSmall,
);
