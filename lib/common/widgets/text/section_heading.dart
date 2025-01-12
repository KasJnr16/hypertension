import 'package:flutter/material.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';

class UniSectionHeading extends StatelessWidget {
  const UniSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = "View all",
    this.showActionButton = true,
    this.textColor,
    this.onPressed,
    this.isSmall = false,
  });

  final String title, buttonTitle;
  final bool showActionButton;
  final Color? textColor;
  final void Function()? onPressed;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: isSmall
                ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
                : Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(
              onPressed: onPressed,
              child: Text(buttonTitle,
                  style: const TextStyle(fontSize: UniSizes.fontSizeSm))),
      ],
    );
  }
}
