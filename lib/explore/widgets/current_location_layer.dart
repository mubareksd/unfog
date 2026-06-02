import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:unfog/explore/explore.dart';

class CurrentLocationLayer extends StatefulWidget {
  const CurrentLocationLayer({required this.position, super.key});

  final LatLng position;

  @override
  State<CurrentLocationLayer> createState() => _CurrentLocationLayerState();
}

class _CurrentLocationLayerState extends State<CurrentLocationLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    unawaited(_pulse.repeat());
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _pulse,
        builder: (ctx, _) {
          // Fetch camera (and derived screen point) inside the builder so the
          // dot tracks the correct screen position on every frame during zoom.
          final camera = MapCamera.of(ctx);
          final pt = camera.latLngToScreenPoint(widget.position);
          final t = _pulse.value;
          final ringRadius = 12.0 + 20.0 * t;
          final ringOpacity = (1.0 - t).clamp(0.0, 1.0);

          return CustomPaint(
            painter: LocationDotPainter(
              position: Offset(pt.x, pt.y),
              ringRadius: ringRadius,
              ringOpacity: ringOpacity,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}
