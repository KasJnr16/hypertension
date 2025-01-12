import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class UniRatingBarIndicator extends StatelessWidget {
  const UniRatingBarIndicator({
    super.key,
    required this.rating,
    this.color = Colors.amber,
  });

  final double rating;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      itemBuilder: (_, __) => Icon(Iconsax.star1, color: color),
    );
  }
}
