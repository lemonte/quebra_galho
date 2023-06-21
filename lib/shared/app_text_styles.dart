import 'package:flutter/material.dart';

import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_line_height.dart';

class AppTextStyles {
  AppTextStyles._();

  //Display
  static const TextStyle display = TextStyle(
    fontWeight: AppFontWeight.semibold,
    fontSize: AppFontSize.xxxl,
    height: AppLineHeight.displayText,
  );

  //Heading
  static const TextStyle headingXxl = TextStyle(
    fontWeight: AppFontWeight.semibold,
    fontSize: AppFontSize.xxl,
    height: AppLineHeight.headingText,
  );

  static const TextStyle headingXl = TextStyle(
    fontWeight: AppFontWeight.semibold,
    fontSize: AppFontSize.xl,
    height: AppLineHeight.headingText,
  );

  static const TextStyle headingLg = TextStyle(
    fontWeight: AppFontWeight.semibold,
    fontSize: AppFontSize.lg,
    height: AppLineHeight.headingText,
  );

  //Body
  static const TextStyle bodyMd = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: AppFontSize.md,
    height: AppLineHeight.shortText,
  );

  static const TextStyle bodySm = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: AppFontSize.sm,
    height: AppLineHeight.longText,
  );

  static const TextStyle bodyXs = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: AppFontSize.xs,
    height: AppLineHeight.longText,
  );

  static const TextStyle bodyXxs = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: AppFontSize.xxs,
    height: AppLineHeight.longText,
  );

  static const TextStyle bodyXxxs = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontSize: AppFontSize.xxxs,
    height: AppLineHeight.shortText,
  );

  //Button
  static const TextStyle button = TextStyle(
    fontWeight: AppFontWeight.bold,
    fontSize: AppFontSize.sm,
    height: AppLineHeight.shortText,
  );
}
