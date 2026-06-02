import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.sharedPreferences})
    : super(SettingsState.initial()) {
    on<LoadSettingsEvent>(_onLoadSettings);
    on<ThemeChangedEvent>(_onThemeChangedEvent);
    on<LocaleChangedEvent>(_onLocaleChangedEvent);
  }

  static const _themeModeKey = 'settings_theme_mode';
  static const _localeKey = 'settings_locale';

  final SharedPreferences sharedPreferences;

  Future<void> _onLoadSettings(
    LoadSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      SettingsState(
        themeMode: _themeModeFromStorage(
          sharedPreferences.getString(_themeModeKey),
        ),
        locale: _localeFromStorage(
          sharedPreferences.getString(_localeKey),
        ),
      ),
    );
  }

  Future<void> _onThemeChangedEvent(
    ThemeChangedEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await sharedPreferences.setString(
      _themeModeKey,
      _themeModeToStorage(event.themeMode),
    );
    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onLocaleChangedEvent(
    LocaleChangedEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await sharedPreferences.setString(
      _localeKey,
      event.locale.languageCode,
    );
    emit(state.copyWith(locale: event.locale));
  }

  static String _themeModeToStorage(ThemeMode mode) => switch (mode) {
    ThemeMode.light => 'light',
    ThemeMode.dark => 'dark',
    ThemeMode.system => 'system',
  };

  static ThemeMode _themeModeFromStorage(String? value) => switch (value) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };

  static Locale _localeFromStorage(String? code) => switch (code) {
    'ar' => const Locale('ar'),
    'am' => const Locale('am'),
    'ti' => const Locale('ti'),
    _ => const Locale('en'),
  };
}
