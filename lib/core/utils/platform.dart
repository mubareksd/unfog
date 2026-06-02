import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';

final bool kIsDesktop = kIsLinux || kIsWindows || kIsMacOS;

final bool kIsMobile = kIsAndroid || kIsIOS;

final bool kIsMacOS = !kIsWeb && UniversalPlatform.isMacOS;

final bool kIsLinux = !kIsWeb && UniversalPlatform.isLinux;
final bool kIsAndroid = !kIsWeb && UniversalPlatform.isAndroid;
final bool kIsIOS = !kIsWeb && UniversalPlatform.isIOS;
final bool kIsWindows = !kIsWeb && UniversalPlatform.isWindows;

const bool kIsWEB = kIsWeb;
