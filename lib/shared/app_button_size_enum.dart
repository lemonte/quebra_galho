import 'package:flutter/widgets.dart';
import 'package:quebra_galho/shared/app_font_weight.dart';
import 'package:quebra_galho/shared/app_text_styles.dart';

enum AppButtonSizeEnum {
  short(Size(double.maxFinite, 22)),
  small(Size(double.maxFinite, 48)),
  smallDynamicWidth(Size(0, 48)),
  large(Size(double.maxFinite, 56)),
  largeDynamicWidth(Size(0, 56));

  final Size size;

  const AppButtonSizeEnum(this.size);

  static TextStyle? getTextStyle(AppButtonSizeEnum value) {
    switch (value) {
      case AppButtonSizeEnum.short:
      case AppButtonSizeEnum.small:
      case AppButtonSizeEnum.smallDynamicWidth:
        return AppTextStyles.bodyXs.copyWith(
          fontWeight: AppFontWeight.semibold,
        );
      case AppButtonSizeEnum.large:
      case AppButtonSizeEnum.largeDynamicWidth:
        return AppTextStyles.button.copyWith(
          fontWeight: AppFontWeight.semibold,
        );
      default:
        return null;
    }
  }
}
