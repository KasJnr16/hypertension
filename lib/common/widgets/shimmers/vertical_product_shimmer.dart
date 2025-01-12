import 'package:flutter/material.dart';
import 'package:hypertension_app/common/widgets/layout/grid_layout.dart';
import 'package:hypertension_app/common/widgets/shimmers/shimmer.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';

class UniVerticalProductShimmer extends StatelessWidget {
  const UniVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    //Container with padding, color, edges , radius and shadwo
    return UniGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image
                  UniShimmerEffect(width: 180, height: 180),
                  SizedBox(height: UniSizes.spaceBtwItems),

                  //Text
                  UniShimmerEffect(width: 160, height: 15),
                  SizedBox(height: UniSizes.spaceBtwItems),
                  UniShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
