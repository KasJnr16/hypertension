import 'package:flutter/widgets.dart';
import 'package:hypertension_app/common/widgets/shimmers/shimmer.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';

class UniListTileShimmer extends StatelessWidget {
  const UniListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(children: [
          UniShimmerEffect(width: 50, height: 50, radius: 50),
          SizedBox(height: UniSizes.spaceBtwItems),
          Column(
            children: [
              UniShimmerEffect(width: 100, height: 15),
              SizedBox(height: UniSizes.spaceBtwItems / 2),
              UniShimmerEffect(width: 80, height: 12),
            ],
          ),
        ]),
      ],
    );
  }
}
