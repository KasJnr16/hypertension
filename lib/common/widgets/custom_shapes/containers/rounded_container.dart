import 'package:flutter/material.dart';
import 'package:hypertension_app/utils/constants/colors.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';
import 'package:hypertension_app/utils/helpers/helper_functions.dart';

class UniRoundedContainer extends StatelessWidget {
  const UniRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = UniSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = UniColors.borderPrimary,
      this.backgroundColor,
      this.padding,
      this.margin});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (HelperFunctions.isDarkMode(context)
                ? UniColors.darkerGrey
                : UniColors.light),
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
