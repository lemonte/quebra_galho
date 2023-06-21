import 'package:flutter/material.dart';
import 'package:quebra_galho/shared/app_global_spacing.dart';
import 'package:quebra_galho/shared/app_text_styles.dart';

class BannerWarning extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  const BannerWarning({
    Key? key,
    required this.text,
    required this.icon,
    this.backgroundColor = const Color(0xffFFCA81),
    this.iconColor = const Color(0xffFFCA81),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor.withOpacity(.16),
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(top: AppGlobalSpacing.xxxs),
      child: Semantics(
        container: true,
        child: Padding(
          padding: const EdgeInsets.all(AppGlobalSpacing.xxxs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: AppGlobalSpacing.xxs,
              ),
              const SizedBox(width: AppGlobalSpacing.xxxs),
              Expanded(
                child: Text(
                  text,
                  style: AppTextStyles.bodyXs.copyWith(
                    color: const Color(0xff333333),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
