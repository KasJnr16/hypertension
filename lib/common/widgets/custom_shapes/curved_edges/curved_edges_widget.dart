import 'package:flutter/material.dart';
import 'package:hypertension_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class UniCurvedEdgeWidget extends StatelessWidget {
  const UniCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: UniCustomeCurvedEdges(), child: child);
  }
}
