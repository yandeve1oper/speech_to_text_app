part of 'root.dart';

const elevatedButtonThemeData = ElevatedButtonThemeData(
  style: LargeElevatedButtonStyle(),
);

abstract class _BaseElevatedButtonStyle extends BaseButtonStyle {
  const _BaseElevatedButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
    super.isFullWidth,
  });

  @override
  MaterialStateProperty<double?>? get elevation =>
      const MaterialStatePropertyAll(0);

  @override
  MaterialStateProperty<Color?>? get backgroundColor =>
      MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.disabled)) {
          return nonMaterialBackgroundColor.withOpacity(0.3);
        }

        if (states.contains(MaterialState.pressed)) {
          return nonMaterialBackgroundColor.withOpacity(0.5);
        }

        return nonMaterialBackgroundColor;
      });

  @override
  MaterialStateProperty<Color?>? get foregroundColor =>
      MaterialStatePropertyAll(nonMaterialForegroundColor);
}

class LargeElevatedButtonStyle extends _BaseElevatedButtonStyle
    with LargeButtonMixin {
  const LargeElevatedButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
    super.isFullWidth,
  });

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}

class MediumElevatedButtonStyle extends _BaseElevatedButtonStyle
    with MediumButtonMixin {
  const MediumElevatedButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
    super.isFullWidth,
  });

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}

class SmallElevatedButtonStyle extends _BaseElevatedButtonStyle
    with SmallButtonMixin {
  const SmallElevatedButtonStyle({
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
    super.isFullWidth = false,
  });

  @override
  MaterialStateProperty<OutlinedBorder?>? get shape =>
      MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.sp),
      ));

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}
