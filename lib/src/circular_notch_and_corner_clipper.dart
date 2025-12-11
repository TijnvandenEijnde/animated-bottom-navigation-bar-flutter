import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CircularNotchedAndCorneredRectangleClipper extends CustomClipper<Path> {
  final ValueListenable<ScaffoldGeometry> geometry;
  final NotchedShape shape;
  final double notchMargin;

  CircularNotchedAndCorneredRectangleClipper({
    required this.geometry,
    required this.shape,
    required this.notchMargin,
  }) : super(reclip: geometry);

  @override
  Path getClip(Size size) {
    try {
      final geometryValue = geometry.value;
      final Rect? button = geometryValue.floatingActionButtonArea?.translate(
        0.0,
        geometryValue.bottomNavigationBarTop! * -1.0,
      );

      return shape.getOuterPath(
        Offset.zero & size,
        button?.inflate(notchMargin),
      );
    } catch (_) {
      return shape.getOuterPath(Offset.zero & size, null);
    }
  }

  @override
  bool shouldReclip(CircularNotchedAndCorneredRectangleClipper oldClipper) {
    return oldClipper.geometry != geometry ||
        oldClipper.shape != shape ||
        oldClipper.notchMargin != notchMargin;
  }
}
