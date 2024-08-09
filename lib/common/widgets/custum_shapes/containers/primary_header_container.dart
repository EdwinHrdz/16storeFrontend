import 'package:flutter/material.dart';
import 'package:store16/common/widgets/custum_shapes/curved_edges/curved_edges_widget.dart';
import 'package:store16/utils/constants/colors.dart';

import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
          color: TColors.primary,
          padding: const EdgeInsets.only(bottom: 0),
          // If [size,isFinite : ocurrira un error.
          child: Stack(
            children: [
              Positioned(top: -150, right: -250, child: TCircularContainer( backgroundColor: TColors.white.withOpacity(0.1),)),
              Positioned(top: 100, right: -300, child: TCircularContainer( backgroundColor: TColors.white.withOpacity(0.1),)),
              child,
              //
            ],
          )
      ),
    );
  }
}