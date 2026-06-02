import 'package:flutter_map/flutter_map.dart' show TileLayer;

/// All supported base-map tile providers.
enum MapType {
  openStreetMap,
  cartoDark,
  cartoLight,
  satellite;

  String get displayName => switch (this) {
    MapType.openStreetMap => 'OpenStreetMap',
    MapType.cartoDark => 'Dark',
    MapType.cartoLight => 'Light',
    MapType.satellite => 'Satellite',
  };

  /// URL template passed to [TileLayer].
  ///
  /// CartoDB templates use the `{s}` subdomain placeholder; Esri does not.
  String get urlTemplate => switch (this) {
    MapType.openStreetMap => 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    MapType.cartoDark =>
      'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
    MapType.cartoLight =>
      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
    MapType.satellite =>
      'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
  };

  /// Subdomains required by CartoDB; empty list for others.
  List<String> get subdomains => switch (this) {
    MapType.cartoDark || MapType.cartoLight => ['a', 'b', 'c', 'd'],
    _ => const [],
  };

  /// Attribution string shown at the bottom of the map.
  String get attribution => switch (this) {
    MapType.openStreetMap => '© OpenStreetMap contributors',
    MapType.cartoDark ||
    MapType.cartoLight => '© OpenStreetMap contributors © CARTO',
    MapType.satellite =>
      'Tiles © Esri — Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP',
  };
}
