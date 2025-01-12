import 'package:flutter/material.dart';
import 'package:hypertension_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hypertension_app/utils/constants/colors.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';
import 'package:hypertension_app/utils/helpers/helper_functions.dart';

class ConfirmActionDialog extends StatelessWidget {
  const ConfirmActionDialog({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: UniRoundedContainer(
        backgroundColor: HelperFunctions.isDarkMode(context)
            ? UniColors.darkerGrey
            : UniColors.white,
        padding: const EdgeInsets.all(UniSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: UniSizes.spaceBtwItems),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: ButtonStyle(
                        side: WidgetStatePropertyAll(
                            BorderSide(color: Colors.red.shade600))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: UniSizes.spaceBtwItems),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text("Confirm"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
