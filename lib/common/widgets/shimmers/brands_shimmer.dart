import 'package:flutter/material.dart';
import 'package:hypertension_app/common/widgets/layout/grid_layout.dart';
import 'package:hypertension_app/common/widgets/shimmers/shimmer.dart';

class UniBrandsShimmer extends StatelessWidget {
  const UniBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return UniGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const UniShimmerEffect(width: 300, height: 80));
  }
}
