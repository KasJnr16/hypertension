import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hypertension_app/common/widgets/shimmers/shimmer.dart';
import 'package:hypertension_app/utils/constants/colors.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';
import 'package:hypertension_app/utils/helpers/helper_functions.dart';

class UniRoundedImage extends StatelessWidget {
  const UniRoundedImage({
    super.key,
    this.width,
    this.height = 200,
    required this.imageUrl,
    this.applyImageRadius = false,
    this.border,
    this.backgroundColor,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.fit = BoxFit.cover,
    this.borderRadius = UniSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor ??
              (HelperFunctions.isDarkMode(context)
                  ? UniColors.darkerGrey
                  : UniColors.light),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => UniShimmerEffect(
                            width: width ?? double.infinity,
                            height: height ?? 158,
                            radius: borderRadius),
                    errorWidget: (context, url, downloadProgress) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(imageUrl),
                  ),
          ),
        ),
      ),
    );
  }
}
