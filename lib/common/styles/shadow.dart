
import 'package:flutter/material.dart';
import 'package:hypertension_app/utils/constants/colors.dart';

class UniShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: UniColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: UniColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
