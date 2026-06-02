import 'package:flutter/material.dart';
import 'package:unfog/l10n/l10n.dart';
import 'package:unfog/models/map_type.dart';
import 'package:unfog/models/map_type_l10n.dart';

class MapTypePicker extends StatelessWidget {
  const MapTypePicker({
    required this.current,
    required this.onSelected,
    super.key,
  });

  final MapType current;
  final void Function(MapType) onSelected;

  static const Map<MapType, IconData> _icons = {
    MapType.openStreetMap: Icons.map,
    MapType.cartoDark: Icons.nights_stay,
    MapType.cartoLight: Icons.wb_sunny_outlined,
    MapType.satellite: Icons.satellite_alt,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      color: Colors.black54,
      child: PopupMenuButton<MapType>(
        tooltip: l10n.switchMapStyle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onSelected: onSelected,
        itemBuilder: (_) => MapType.values
            .map(
              (type) => PopupMenuItem<MapType>(
                value: type,
                child: Row(
                  children: [
                    Icon(
                      _icons[type],
                      color: type == current ? Colors.teal : Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      type.localizedName(l10n),
                      style: TextStyle(
                        color: type == current ? Colors.teal : Colors.white,
                        fontWeight: type == current
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    if (type == current) ...[
                      const Spacer(),
                      const Icon(
                        Icons.check,
                        color: Colors.teal,
                        size: 16,
                      ),
                    ],
                  ],
                ),
              ),
            )
            .toList(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_icons[current], color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Text(
                current.localizedName(l10n),
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(width: 3),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.white70,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
