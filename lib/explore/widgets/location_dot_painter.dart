import 'package:flutter/material.dart';

class LocationDotPainter extends CustomPainter {
  const LocationDotPainter({
    required this.position,
    required this.ringRadius,
    required this.ringOpacity,
  });

  final Offset position;
  final double ringRadius;
  final double ringOpacity;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..drawCircle(
        position,
        ringRadius,
        Paint()
          ..color = const Color(
            0xFF00E5FF,
          ).withValues(alpha: ringOpacity * 0.35)
          ..style = PaintingStyle.fill,
      )
      ..drawCircle(
        position,
        16,
        Paint()
          ..color = const Color(0xFF00E5FF).withValues(alpha: 0.18)
          ..style = PaintingStyle.fill,
      )
      ..drawCircle(
        position,
        8,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill,
      )
      ..drawCircle(
        position,
        6,
        Paint()
          ..color = const Color(0xFF00E5FF)
          ..style = PaintingStyle.fill,
      );
  }

  @override
  bool shouldRepaint(LocationDotPainter old) =>
      old.position != position ||
      old.ringRadius != ringRadius ||
      old.ringOpacity != ringOpacity;
}
