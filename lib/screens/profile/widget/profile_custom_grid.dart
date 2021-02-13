import 'package:flutter/material.dart';

class ProfileCustomGrid extends StatelessWidget {
  const ProfileCustomGrid({
    Key key,
    this.sliver,
    this.countCrossAxis,
    this.spacingCrossAxis,
    this.ratioChildAspect,
    this.spacingMainAxis,
  }) : super(key: key);

  final SliverChildListDelegate sliver;
  final int countCrossAxis;
  final double spacingCrossAxis;
  final double ratioChildAspect;
  final double spacingMainAxis;

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: countCrossAxis,
        crossAxisSpacing: spacingCrossAxis,
        childAspectRatio: ratioChildAspect,
        mainAxisSpacing: spacingMainAxis,
      ),
      childrenDelegate: sliver,
    );
  }
}
