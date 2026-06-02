part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSettingsEvent extends SettingsEvent {}

class ThemeChangedEvent extends SettingsEvent {
  const ThemeChangedEvent(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}

class LocaleChangedEvent extends SettingsEvent {
  const LocaleChangedEvent(this.locale);

  final Locale locale;

  @override
  List<Object?> get props => [locale];
}
