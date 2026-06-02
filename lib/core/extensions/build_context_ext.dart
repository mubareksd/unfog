import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  Locale get locale => Localizations.localeOf(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  bool get isDarkMode => theme.brightness == Brightness.dark;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  NavigatorState get navigator => Navigator.of(this);
}
