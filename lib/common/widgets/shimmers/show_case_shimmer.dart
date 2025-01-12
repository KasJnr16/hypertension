import 'package:flutter/widgets.dart';
import 'package:hypertension_app/common/widgets/shimmers/box_shimmer.dart';
import 'package:hypertension_app/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';

class ShowCaseShimmer extends StatelessWidget {
  const ShowCaseShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UniListTileShimmer(),
        SizedBox(height: UniSizes.spaceBtwItems),
        UniBoxesShimmer(),
        SizedBox(height: UniSizes.spaceBtwItems)
      ],
    );
  }
}