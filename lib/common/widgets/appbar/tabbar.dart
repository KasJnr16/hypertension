import 'package:flutter/material.dart';
import 'package:hypertension_app/utils/constants/colors.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';
import 'package:hypertension_app/utils/device/device_utility.dart';
import 'package:hypertension_app/utils/helpers/helper_functions.dart';

class UniTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UniTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? UniColors.black : UniColors.white,
      child: TabBar(
        labelStyle: const TextStyle(fontSize: UniSizes.fontSizeSm),
        isScrollable: true,
        indicatorColor: UniColors.primary,
        labelColor: dark ? UniColors.white : UniColors.primary,
        unselectedLabelColor: UniColors.darkGrey,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UniDeviceUtility.getAppBarHeight());
}
