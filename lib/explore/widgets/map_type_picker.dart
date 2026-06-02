import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:unfog/l10n/l10n.dart';
import 'package:unfog/models/map_type.dart';
import 'package:unfog/models/map_type_l10n.dart';

class MapTypePicker extends StatefulWidget {
  const MapTypePicker({
    required this.current,
    required this.onSelected,
    super.key,
  });

  final MapType current;
  final void Function(MapType) onSelected;

  @override
  State<MapTypePicker> createState() => _MapTypePickerState();
}

class _MapTypePickerState extends State<MapTypePicker> {
  final _menuController = MenuController();

  static const Map<MapType, IconData> _icons = {
    MapType.openStreetMap: Icons.map_outlined,
    MapType.cartoDark: Icons.nights_stay_outlined,
    MapType.cartoLight: Icons.wb_sunny_outlined,
    MapType.satellite: Icons.satellite_alt_outlined,
  };

  static const Map<MapType, List<Color>> _previewColors = {
    MapType.openStreetMap: [
      Color(0xFFF2EFE9),
      Color(0xFFB8D4A8),
      Color(0xFF8BB8D4),
    ],
    MapType.cartoDark: [
      Color(0xFF1C1C28),
      Color(0xFF2A2A3C),
      Color(0xFF3D3D56),
    ],
    MapType.cartoLight: [
      Color(0xFFF8F8F8),
      Color(0xFFE4E4E4),
      Color(0xFFCFCFCF),
    ],
    MapType.satellite: [
      Color(0xFF2D4A1E),
      Color(0xFF5C4A32),
      Color(0xFF1A3D2E),
    ],
  };

  void _select(MapType type) {
    _menuController.close();
    widget.onSelected(type);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return MenuAnchor(
      controller: _menuController,
      alignmentOffset: const Offset(-8, 8),
      style: MenuStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
        backgroundColor: const WidgetStatePropertyAll(Color(0xEE1A1A24)),
        elevation: const WidgetStatePropertyAll(8),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        shadowColor: WidgetStatePropertyAll(
          Colors.black.withValues(alpha: 0.4),
        ),
      ),
      menuChildren: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
          child: Text(
            l10n.switchMapStyle,
            style: theme.textTheme.labelMedium?.copyWith(
              color: Colors.white60,
              letterSpacing: 0.2,
            ),
          ),
        ),
        ...MapType.values.map(
          (type) => _MapTypeMenuTile(
            type: type,
            label: type.localizedName(l10n),
            icon: _icons[type]!,
            previewColors: _previewColors[type]!,
            isSelected: type == widget.current,
            primaryColor: primary,
            onTap: () => _select(type),
          ),
        ),
      ],
      builder: (context, controller, child) {
        return _FrostedChip(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.layers_outlined,
                color: Colors.white.withValues(alpha: 0.9),
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                widget.current.localizedName(l10n),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.95),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 2),
              AnimatedRotation(
                turns: controller.isOpen ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white.withValues(alpha: 0.75),
                  size: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FrostedChip extends StatelessWidget {
  const _FrostedChip({
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.38),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.18),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MapTypeMenuTile extends StatelessWidget {
  const _MapTypeMenuTile({
    required this.type,
    required this.label,
    required this.icon,
    required this.previewColors,
    required this.isSelected,
    required this.primaryColor,
    required this.onTap,
  });

  final MapType type;
  final String label;
  final IconData icon;
  final List<Color> previewColors;
  final bool isSelected;
  final Color primaryColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (isSelected) {
            return primaryColor.withValues(alpha: 0.15);
          }
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return Colors.white.withValues(alpha: 0.08);
          }
          return Colors.transparent;
        }),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: SizedBox(
        width: 220,
        child: Row(
          children: [
            _MapStylePreview(colors: previewColors),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: isSelected ? primaryColor : Colors.white,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Icon(
                    icon,
                    size: 14,
                    color: isSelected
                        ? primaryColor.withValues(alpha: 0.8)
                        : Colors.white38,
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle_rounded,
                color: primaryColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

class _MapStylePreview extends StatelessWidget {
  const _MapStylePreview({required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        width: 44,
        height: 32,
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
              ),
            ),
            CustomPaint(painter: _MapPreviewRoadsPainter(colors.first)),
          ],
        ),
      ),
    );
  }
}

/// Decorative road lines suggesting a map tile preview.
class _MapPreviewRoadsPainter extends CustomPainter {
  _MapPreviewRoadsPainter(this.baseColor);

  final Color baseColor;

  @override
  void paint(Canvas canvas, Size size) {
    final roadColor = Color.lerp(baseColor, Colors.white, 0.35)!;
    final minorRoadColor = Color.lerp(baseColor, Colors.white, 0.2)!;

    final majorPaint = Paint()
      ..color = roadColor.withValues(alpha: 0.7)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final minorPaint = Paint()
      ..color = minorRoadColor.withValues(alpha: 0.5)
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    canvas
      ..drawLine(
        Offset(size.width * 0.15, size.height * 0.7),
        Offset(size.width * 0.85, size.height * 0.35),
        majorPaint,
      )
      ..drawLine(
        Offset(size.width * 0.3, size.height * 0.1),
        Offset(size.width * 0.55, size.height * 0.9),
        minorPaint,
      )
      ..drawLine(
        Offset(size.width * 0.65, size.height * 0.05),
        Offset(size.width * 0.75, size.height * 0.95),
        minorPaint,
      );
  }

  @override
  bool shouldRepaint(covariant _MapPreviewRoadsPainter oldDelegate) =>
      oldDelegate.baseColor != baseColor;
}
