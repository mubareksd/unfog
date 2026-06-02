import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unfog/core/utils/platform.dart';
import 'package:unfog/explore/explore.dart';
import 'package:unfog/l10n/l10n.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  /// Material 3 [NavigationBar] height — FABs sit above the bottom nav.
  static const _navigationBarHeight = 80.0;

  final _mapController = MapController();
  LatLng? _currentLocation;
  bool _followUser = true;
  double _mapRotation = 0;

  @override
  void initState() {
    super.initState();
    // Location stream is started after permission is confirmed in _autoStartTra
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _autoStartTracking(),
    );
  }

  Future<void> _autoStartTracking() async {
    LocationPermission fgStatus;
    if (kIsAndroid) {
      fgStatus = await Geolocator.requestPermission();
    } else {
      fgStatus = LocationPermission.always;
    }
    if (fgStatus == LocationPermission.denied ||
        fgStatus == LocationPermission.deniedForever) {
      // Start stream anyway — it will silently fail until the user
      // grants permission.
      await _startLocationUpdates();
      if (!mounted) return;
      final l10n = context.l10n;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.locationPermissionMessage),
          action: SnackBarAction(
            label: l10n.openSettings,
            onPressed: openAppSettings,
          ),
        ),
      );
      return;
    }

    // Permission granted — start UI location stream now.
    await _startLocationUpdates();

    if (kIsAndroid) {
      // Request background location (Android 10+) — best effort.
      await Permission.locationAlways.request();

      // Request POST_NOTIFICATIONS permission (Android 13+, required for
      // the foreground service notification).

      await Permission.notification.request();
      // Activity recognition drives the step-detector walking gate
      // (Android 10+).
      await Permission.activityRecognition.request();
    }
  }

  Future<void> _startLocationUpdates() async {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen(
      (position) {
        if (!mounted) return;
        final loc = LatLng(position.latitude, position.longitude);
        setState(() => _currentLocation = loc);
        if (_followUser) {
          _mapController.move(loc, _mapController.camera.zoom);
        }
      },
      onError: (_) {
        /* permission not yet granted or GPS unavailable */
      },
      cancelOnError: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
          ),
          child: Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter:
                        _currentLocation ?? const LatLng(9.025, 38.747),
                    initialZoom: 15,
                    onPositionChanged: (camera, hasGesture) {
                      if (hasGesture) setState(() => _followUser = false);
                      if (camera.rotation != _mapRotation) {
                        setState(() => _mapRotation = camera.rotation);
                      }
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: state.mapType.urlTemplate,
                      subdomains: state.mapType.subdomains,
                      userAgentPackageName: 'com.mubareksd.unfog',
                      retinaMode: RetinaMode.isHighDensity(context),
                    ),
                    if (_currentLocation != null)
                      CurrentLocationLayer(position: _currentLocation!),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.55),
                            Colors.black.withValues(alpha: 0.25),
                            Colors.transparent,
                          ],
                          stops: const [0, 0.55, 1],
                        ),
                      ),
                      child: SizedBox(
                        height: MediaQuery.paddingOf(context).top + 48,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.paddingOf(context).top + 12,
                  right: 16,
                  child: MapTypePicker(
                    current: state.mapType,
                    onSelected: (type) => context.read<ExploreBloc>().add(
                      ChangeMapTypeEvent(type),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.only(
                bottom:
                    _navigationBarHeight + MediaQuery.paddingOf(context).bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_mapRotation.abs() > 0.5)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: FloatingActionButton.small(
                        heroTag: 'compass',
                        tooltip: l10n.pointNorth,
                        onPressed: () => _mapController.rotate(0),
                        child: Transform.rotate(
                          angle: -_mapRotation * 3.141592653589793 / 180,
                          child: const Icon(Icons.navigation),
                        ),
                      ),
                    ),
                  if (!_followUser)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: FloatingActionButton.small(
                        heroTag: 'recenter',
                        tooltip: l10n.findMe,
                        onPressed: () {
                          if (_currentLocation != null) {
                            _mapController.move(
                              _currentLocation!,
                              _mapController.camera.zoom,
                            );
                          }
                          setState(() => _followUser = true);
                        },
                        child: const Icon(Icons.my_location),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
