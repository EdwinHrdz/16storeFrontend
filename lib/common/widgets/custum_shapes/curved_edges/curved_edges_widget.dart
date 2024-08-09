import 'package:flutter/material.dart';
import 'package:store16/common/widgets/custum_shapes/curved_edges/curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustumCurvedEdges(),
      child: child,
    );
  }
}