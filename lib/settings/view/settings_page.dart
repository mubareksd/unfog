import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unfog/l10n/l10n.dart';
import 'package:unfog/settings/settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const _supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
    Locale('am'),
    Locale('ti'),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ListView(
            children: [
              _SectionHeader(title: l10n.appearanceSection),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SegmentedButton<ThemeMode>(
                  segments: [
                    ButtonSegment(
                      value: ThemeMode.system,
                      label: Text(l10n.themeSystem),
                      icon: const Icon(Icons.brightness_auto),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      label: Text(l10n.themeLight),
                      icon: const Icon(Icons.light_mode),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text(l10n.themeDark),
                      icon: const Icon(Icons.dark_mode),
                    ),
                  ],
                  selected: {state.themeMode},
                  onSelectionChanged: (selection) {
                    context.read<SettingsBloc>().add(
                      ThemeChangedEvent(selection.first),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              _SectionHeader(title: l10n.languageSection),
              RadioGroup<Locale>(
                groupValue: state.locale,
                onChanged: (value) {
                  if (value == null) return;
                  context.read<SettingsBloc>().add(
                    LocaleChangedEvent(value),
                  );
                },
                child: Column(
                  children: _supportedLocales
                      .map(
                        (locale) => RadioListTile<Locale>(
                          title: Text(_localeLabel(l10n, locale)),
                          value: locale,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static String _localeLabel(AppLocalizations l10n, Locale locale) {
    return switch (locale.languageCode) {
      'ar' => l10n.languageArabic,
      'am' => l10n.languageAmharic,
      'ti' => l10n.languageTigrinya,
      _ => l10n.languageEnglish,
    };
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
