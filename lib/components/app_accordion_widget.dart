import 'package:flutter/material.dart';
import 'package:quebra_galho/shared/app_colors.dart';

class AppAccordionWidget extends StatefulWidget {
  final Widget title;
  final Text? subtitle;
  final EdgeInsetsGeometry titlePadding;
  final bool initiallyExpanded;
  final CrossAxisAlignment expandedCrossAxisAlignment;
  final bool showLastDivider;
  final List<Widget> children;
  final EdgeInsets childrenPadding;
  final void Function(bool v)? onExpansionChanged;

  const AppAccordionWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.titlePadding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.initiallyExpanded = false,
    this.expandedCrossAxisAlignment = CrossAxisAlignment.start,
    this.showLastDivider = true,
    this.children = const <Widget>[],
    this.childrenPadding = const EdgeInsets.only(
      bottom: 16,
    ),
    this.onExpansionChanged,
  }) : super(key: key);

  @override
  State<AppAccordionWidget> createState() => _AppAccordionWidgetState();
}

class _AppAccordionWidgetState extends State<AppAccordionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    super.initState();

    if (widget.initiallyExpanded) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: AppColors.iconsColorApp,
          ),
          child: ExpansionTile(
            onExpansionChanged: (v) {
              v ? _controller.forward() : _controller.reverse();
              widget.onExpansionChanged?.call(v);
            },
            maintainState: true,
            initiallyExpanded: widget.initiallyExpanded,
            expandedCrossAxisAlignment: widget.expandedCrossAxisAlignment,
            trailing: _IconWidget(controller: _controller),
            tilePadding: widget.titlePadding,
            childrenPadding: widget.childrenPadding,
            title: widget.title,
            subtitle: widget.subtitle,
            children: widget.children,
          ),
        ),
        Visibility(
          visible: widget.showLastDivider,
          child: const Divider(
            color: AppColors.iconsColorApp,
          ),
        ),
      ],
    );
  }
}

class _IconWidget extends StatelessWidget {
  final AnimationController controller;

  const _IconWidget({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 0.5).animate(controller),
      child: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: AppColors.iconsColorApp,
      ),
    );
  }
}

// class AppAccordionSkeletonV2Widget extends StatelessWidget {
//   final double titleWidth;
//   final double? subtitleWidth;
//   final EdgeInsetsGeometry titlePadding;
//   final bool showLastDivider;

//   const AppAccordionSkeletonV2Widget({
//     super.key,
//     required this.titleWidth,
//     this.subtitleWidth,
//     this.titlePadding = const EdgeInsets.symmetric(
//       horizontal: 16,
//     ),
//     this.showLastDivider = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppSkeletonWidget.fromBase(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: AppGlobalSpacing.xxxs),
//           AppSkeletonContainerWidget(width: titleWidth),
//           Visibility(
//             visible: showLastDivider,
//             child: Padding(
//               padding: const EdgeInsets.only(top: AppGlobalSpacing.nano),
//               child: AppSkeletonContainerWidget(width: subtitleWidth),
//             ),
//           ),
//           const SizedBox(height: AppGlobalSpacing.xxxs),
//           Visibility(
//             visible: showLastDivider,
//             child: AppDivider.hairline(color: AppColorsV2.neutralSoft),
//           ),
//         ],
//       ),
//     );
//   }
// }
