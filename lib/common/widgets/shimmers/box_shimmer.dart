import 'package:flutter/widgets.dart';
import 'package:hypertension_app/common/widgets/shimmers/shimmer.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';

class UniBoxesShimmer extends StatelessWidget {
  const UniBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(children: [
          Expanded(child: UniShimmerEffect(width: 150, height: 110)),
          SizedBox(width: UniSizes.spaceBtwItems),
          Expanded(child: UniShimmerEffect(width: 150, height: 110)),
          SizedBox(width: UniSizes.spaceBtwItems),
          Expanded(child: UniShimmerEffect(width: 150, height: 110)),
        ]),
      ],
    );
  }
}
