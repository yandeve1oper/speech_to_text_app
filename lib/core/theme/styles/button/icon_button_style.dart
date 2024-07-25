part of 'root.dart';

final iconButtonThemeData = IconButtonThemeData(
  style: IconButtonStyle(),
);

final darkIconButtonThemeData = IconButtonThemeData(
  style: DarkIconButtonStyle(),
);

abstract class _BaseIconButtonStyle extends ButtonStyle {
  const _BaseIconButtonStyle({
    this.nonMaterialBackgroundColor,
    this.nonMaterialForegroundColor,
  });

  final Color? nonMaterialBackgroundColor;
  final Color? nonMaterialForegroundColor;

  MaterialStateProperty<Color?>? getMaterialBackgroundColor(Color color) =>
      MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.disabled)) {
          return color.withOpacity(0.3);
        }

        if (states.contains(MaterialState.pressed)) {
          return color.withOpacity(0.5);
        }

        return color;
      });

  @override
  MaterialStateProperty<Color?>? get backgroundColor =>
      nonMaterialBackgroundColor != null
          ? getMaterialBackgroundColor(nonMaterialBackgroundColor!)
          : super.backgroundColor;

  @override
  MaterialStateProperty<Color?>? get foregroundColor =>
      nonMaterialForegroundColor != null
          ? MaterialStatePropertyAll(nonMaterialForegroundColor)
          : super.foregroundColor;

  @override
  MaterialStateProperty<Color?>? get iconColor =>
      nonMaterialForegroundColor != null
          ? MaterialStatePropertyAll(nonMaterialForegroundColor)
          : super.iconColor;
}

class IconButtonStyle extends _BaseIconButtonStyle {
  IconButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
  });

  final Color defaultNonMaterialBackgroundColor = AppColors.white;
  final Color defaultNonMaterialForegroundColor = AppColors.gray.shade900;

  @override
  MaterialStateProperty<OutlinedBorder?>? get shape => MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      );

  @override
  MaterialStateProperty<double?>? get elevation =>
      const MaterialStatePropertyAll(0);

  @override
  MaterialStateProperty<Color?>? get backgroundColor =>
      getMaterialBackgroundColor(
          nonMaterialBackgroundColor ?? defaultNonMaterialBackgroundColor);

  @override
  MaterialStateProperty<Color?>? get foregroundColor =>
      MaterialStatePropertyAll(
          nonMaterialForegroundColor ?? defaultNonMaterialForegroundColor);

  @override
  MaterialStateProperty<Color?>? get iconColor => MaterialStatePropertyAll(
      nonMaterialForegroundColor ?? defaultNonMaterialForegroundColor);

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(42.w, 42.w));
}

class DarkIconButtonStyle extends IconButtonStyle {
  DarkIconButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
  });

  @override
  Color get defaultNonMaterialBackgroundColor => AppColors.gray.shade700;

  @override
  Color get defaultNonMaterialForegroundColor => AppColors.white;
}

class LargeIconButtonStyle extends _BaseIconButtonStyle {
  const LargeIconButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
  });

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(64.w, 64.w));
}

class MediumIconButtonStyle extends _BaseIconButtonStyle {
  const MediumIconButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
  });

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(42.w, 42.w));
}

class SmallIconButtonStyle extends _BaseIconButtonStyle {
  const SmallIconButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
  });

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(32.w, 32.w));
}
