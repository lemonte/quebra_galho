import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quebra_galho/shared/app_colors.dart';
import 'package:quebra_galho/shared/app_border_radius.dart';
import 'package:quebra_galho/shared/app_button_size_enum.dart';
import 'package:quebra_galho/shared/app_global_spacing.dart';
import 'package:quebra_galho/shared/app_icon_direction_enum.dart';
import 'package:quebra_galho/shared/app_shadow.dart';

class AppContainedButtonWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final AppButtonSizeEnum buttonSize;
  final AppIconDirectionEnum iconDirection;
  final bool isLoading;
  final bool semanticIsLink;
  final String semanticsLabel;
  final double webMaxWidth;
  final VoidCallback? onPressed;

  const AppContainedButtonWidget({
    Key? key,
    required this.title,
    this.icon,
    this.buttonSize = AppButtonSizeEnum.large,
    this.iconDirection = AppIconDirectionEnum.right,
    this.isLoading = false,
    this.semanticIsLink = false,
    this.semanticsLabel = '',
    this.onPressed,
    this.webMaxWidth = 430,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constraints = kIsWeb ? BoxConstraints(maxWidth: webMaxWidth) : null;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: onPressed != null ? _styleRegular : _styleDisabled,
        constraints: constraints,
        child: Semantics(
          button: !semanticIsLink,
          link: semanticIsLink,
          container: true,
          enabled: onPressed != null,
          label: semanticsLabel.isEmpty ? title : semanticsLabel,
          hint: Platform.isAndroid && semanticIsLink ? 'Link' : null,
          child: ExcludeSemantics(
            child: _ButtonWidget(
              title: title,
              icon: icon,
              buttonSize: buttonSize,
              iconDirection: iconDirection,
              isLoading: isLoading,
              onPressed: onPressed,
            ),
          ),
        ),
      ),
    );
  }

  Decoration get _styleRegular => AppShadow.primaryButtonLv1.copyWith(
        borderRadius: AppBorderRadius.radiusPill,
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.primaryColorApp,
            AppColors.primaryColorApp,
          ],
        ),
      );

  Decoration get _styleDisabled => BoxDecoration(
        borderRadius: AppBorderRadius.radiusPill,
        color: const Color(0xFFF6F6F6),
      );
}

class _ButtonWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final AppButtonSizeEnum buttonSize;
  final AppIconDirectionEnum iconDirection;
  final bool isLoading;
  final VoidCallback? onPressed;

  const _ButtonWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.buttonSize,
    required this.iconDirection,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(buttonSize.size),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: AppBorderRadius.radiusPill),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.primaryColorApp;
            }
            return Colors.transparent;
          },
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: isLoading
          ? const _LoadingWidget()
          : _TextIconWidget(
              title: title,
              icon: icon,
              buttonSize: buttonSize,
              iconDirection: iconDirection,
              isEnabled: onPressed != null,
            ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
      ),
    );
  }
}

class _TextIconWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final AppButtonSizeEnum buttonSize;
  final AppIconDirectionEnum iconDirection;
  final bool isEnabled;

  const _TextIconWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.buttonSize,
    required this.iconDirection,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentColor =
        isEnabled ? const Color(0xFFFFFFFF) : const Color(0xFFCCCCCC);

    final iconMargin = iconDirection == AppIconDirectionEnum.right
        ? const EdgeInsets.only(left: AppGlobalSpacing.nano)
        : const EdgeInsets.only(right: AppGlobalSpacing.nano);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: getLstContent(contentColor, iconMargin),
    );
  }

  List<Widget> getLstContent(
    Color contentColor,
    EdgeInsetsGeometry iconMargin,
  ) {
    final lstContent = <Widget>[
      Text(
        title,
        style: AppButtonSizeEnum.getTextStyle(buttonSize)
            ?.copyWith(color: contentColor),
      ),
      Visibility(
        visible: icon != null,
        child: Container(
          margin: iconMargin,
          child: icon != null
              ? Icon(
                  icon!,
                  color: contentColor,
                )
              : null,
        ),
      ),
    ];

    if (iconDirection != AppIconDirectionEnum.right) {
      return lstContent.reversed.toList();
    }

    return lstContent;
  }
}
