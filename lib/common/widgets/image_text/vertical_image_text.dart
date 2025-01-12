import 'package:flutter/material.dart';
import 'package:hypertension_app/common/widgets/images/circular_image.dart';
import 'package:hypertension_app/utils/constants/colors.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';
import 'package:hypertension_app/utils/helpers/helper_functions.dart';

class UniVerticalImageText extends StatelessWidget {
  const UniVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = UniColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: UniSizes.spaceBtwItems),
        child: Column(
          children: [
            //Icons
            UniCircularImage(
                imageUrl: image,
                fit: BoxFit.fitWidth,
                padding: UniSizes.sm * 1.4,
                isNetworkImage: isNetworkImage,
                backgroundColor: backgroundColor,
                overlayColor: HelperFunctions.isDarkMode(context)
                    ? UniColors.light
                    : UniColors.dark),

            //Text
            const SizedBox(height: UniSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
