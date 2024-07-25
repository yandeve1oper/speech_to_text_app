part of 'root.dart';

const outlinedButtonTheme = OutlinedButtonThemeData(
  style: LargeOutlinedButtonStyle(),
);

abstract class _BaseOutlinedButtonStyle extends BaseButtonStyle {
  const _BaseOutlinedButtonStyle({
    this.nonMaterialSideColor = AppColors.primary,
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor = AppColors.primary,
    super.isFullWidth,
  });

  final Color nonMaterialSideColor;

  @override
  MaterialStateProperty<BorderSide?>? get side =>
      MaterialStateProperty.resolveWith<BorderSide?>((states) {
        final isDisabled = states.contains(MaterialState.disabled);

        return isDisabled
            ? BorderSide(color: nonMaterialSideColor.withOpacity(0.5))
            : BorderSide(color: nonMaterialSideColor);
      });

  @override
  MaterialStateProperty<Color?>? get foregroundColor =>
      MaterialStateProperty.resolveWith<Color?>((states) {
        final isDisabled = states.contains(MaterialState.disabled);
        final isSelected = states.contains(MaterialState.selected);

        if (isSelected) {
          return isSelected ? Colors.white : nonMaterialForegroundColor;
        }

        return isDisabled
            ? nonMaterialForegroundColor.withOpacity(0.5)
            : nonMaterialForegroundColor;
      });

  @override
  MaterialStateProperty<Color?>? get backgroundColor =>
      MaterialStateProperty.resolveWith<Color?>((states) {
        final isSelected = states.contains(MaterialState.selected);

        return isSelected ? nonMaterialBackgroundColor : null;
      });
}

class LargeOutlinedButtonStyle extends _BaseOutlinedButtonStyle
    with LargeButtonMixin {
  const LargeOutlinedButtonStyle({
    super.nonMaterialSideColor,
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
    super.isFullWidth,
  });

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}

class MediumOutlinedButtonStyle extends _BaseOutlinedButtonStyle
    with MediumButtonMixin {
  const MediumOutlinedButtonStyle({
    super.nonMaterialSideColor,
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
    super.isFullWidth,
  });

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}

class SmallOutlinedButtonStyle extends _BaseOutlinedButtonStyle
    with SmallButtonMixin {
  const SmallOutlinedButtonStyle({
    super.nonMaterialSideColor,
    super.nonMaterialBackgroundColor,
    super.nonMaterialForegroundColor,
    super.isFullWidth,
  });

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}
