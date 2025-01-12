import 'package:flutter/material.dart';
import 'package:hypertension_app/common/styles/spacing_styles.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';
import 'package:hypertension_app/utils/constants/text_string.dart';
import 'package:hypertension_app/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.onPressed});

  final String image, title, subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: UniSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //image
              Image(
                image: AssetImage(image),
                width: HelperFunctions.screenWidth() * 0.6,
                height: HelperFunctions.screenHeight() * 0.4,
              ),

              const SizedBox(height: UniSizes.spaceBtwSection),

              //Title $ SubTitles
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UniSizes.spaceBtwItems),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UniSizes.spaceBtwSection),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text(UniTexts.uContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
