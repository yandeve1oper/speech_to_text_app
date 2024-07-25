part of 'root.dart';

const textButtonThemeData = TextButtonThemeData(
  style: LargeTextButtonStyle(),
);

class LargeTextButtonStyle extends BaseButtonStyle with LargeButtonMixin {
  const LargeTextButtonStyle(
      {super.nonMaterialBackgroundColor,
      super.nonMaterialForegroundColor = AppColors.primary,
      super.isFullWidth});

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}

class MediumTextButtonStyle extends BaseButtonStyle with MediumButtonMixin {
  const MediumTextButtonStyle(
      {super.nonMaterialBackgroundColor,
      super.nonMaterialForegroundColor = AppColors.primary,
      super.isFullWidth});

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}

class SmallTextButtonStyle extends BaseButtonStyle with SmallButtonMixin {
  const SmallTextButtonStyle(
      {super.nonMaterialBackgroundColor,
      super.nonMaterialForegroundColor = AppColors.primary,
      super.isFullWidth});

  @override
  MaterialStateProperty<Size?>? get minimumSize =>
      MaterialStatePropertyAll(Size(super.width, defaultHeight));
}
