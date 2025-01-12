import 'package:flutter/material.dart';
import 'package:hypertension_app/utils/constants/colors.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';

class UniAnimationLoaderWidget extends StatelessWidget {
  const UniAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(UniSizes.defaultSpace),
      child: Center(
        child: Column(
          children: [
            // Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
            // const SizedBox(height: UniSizes.defaultSpace),
            Center(
              child: Image.asset(
                // Display the GIF instead of Lottie animation
                animation,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            const SizedBox(height: UniSizes.defaultSpace),

            //
            Text(
              text,
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: UniSizes.defaultSpace),

            //
            showAction
                ? SizedBox(
                    width: 250,
                    child: OutlinedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(UniColors.dark)),
                      onPressed: onActionPressed,
                      child: Text(
                        actionText!,
                        style:
                            textTheme.bodyMedium!.apply(color: UniColors.light),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
