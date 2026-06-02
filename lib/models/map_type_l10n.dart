import 'package:unfog/l10n/l10n.dart';
import 'package:unfog/models/map_type.dart';

extension MapTypeL10n on MapType {
  String localizedName(AppLocalizations l10n) => switch (this) {
    MapType.openStreetMap => l10n.mapOpenStreetMap,
    MapType.cartoDark => l10n.mapDark,
    MapType.cartoLight => l10n.mapLight,
    MapType.satellite => l10n.mapSatellite,
  };
}
