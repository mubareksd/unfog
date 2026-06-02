part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    required this.themeMode,
    required this.locale,
  });

  factory SettingsState.initial() => const SettingsState(
    themeMode: ThemeMode.system,
    locale: Locale('en'),
  );

  final ThemeMode themeMode;
  final Locale locale;

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [
    themeMode,
    locale,
  ];
}
