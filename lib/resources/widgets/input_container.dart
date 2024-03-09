import 'package:flutter/material.dart';
import 'package:test_flutter/resources/utils/app/app_theme.dart';

class InputContainer extends StatelessWidget {
  const InputContainer(
      {Key? key,
      required this.child,
      this.marginContainer,
      this.paddingContainer,
      this.colorContainer})
      : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? paddingContainer;
  final EdgeInsetsGeometry? marginContainer;

  final Color? colorContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginContainer ?? const EdgeInsets.all(10),
      padding: paddingContainer ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      // width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: colorContainer ?? AppTheme.primaryColor.withAlpha(50)),
      child: child,
    );
  }
}
