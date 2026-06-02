import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unfog/core/constants/constants.dart';
import 'package:unfog/l10n/l10n.dart';
import 'package:unfog/settings/settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              ListTile(
                leading: Icon(_themeIcon(state.themeMode)),
                title: Text(_themeLabel(l10n, state.themeMode)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showThemePicker(context, state.themeMode),
              ),
              _SectionHeader(title: l10n.languageSection),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(_localeLabel(l10n, state.locale)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showLocalePicker(context, state.locale),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showThemePicker(BuildContext context, ThemeMode selected) {
    final l10n = context.l10n;

    return _showAdaptiveSelection<ThemeMode>(
      context: context,
      title: l10n.appearanceSection,
      selected: selected,
      options: <ThemeMode>[
        ThemeMode.system,
        ThemeMode.light,
        ThemeMode.dark,
      ],
      labelOf: (mode) => _themeLabel(l10n, mode),
      iconOf: (mode) => Icon(_themeIcon(mode)),
      onSelected: (mode) {
        context.read<SettingsBloc>().add(ThemeChangedEvent(mode));
      },
    );
  }

  Future<void> _showLocalePicker(BuildContext context, Locale selected) {
    final l10n = context.l10n;

    return _showAdaptiveSelection<Locale>(
      context: context,
      title: l10n.languageSection,
      selected: selected,
      options: <Locale>[
        const Locale('en'),
        const Locale('ar'),
        const Locale('am'),
        const Locale('ti'),
      ],
      labelOf: (locale) => _localeLabel(l10n, locale),
      onSelected: (locale) {
        context.read<SettingsBloc>().add(LocaleChangedEvent(locale));
      },
    );
  }

  static String _themeLabel(AppLocalizations l10n, ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => l10n.themeSystem,
      ThemeMode.light => l10n.themeLight,
      ThemeMode.dark => l10n.themeDark,
    };
  }

  static IconData _themeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => Icons.brightness_auto,
      ThemeMode.light => Icons.light_mode,
      ThemeMode.dark => Icons.dark_mode,
    };
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

Future<void> _showAdaptiveSelection<T>({
  required BuildContext context,
  required String title,
  required T selected,
  required List<T> options,
  required String Function(T) labelOf,
  required void Function(T) onSelected,
  Widget? Function(T)? iconOf,
}) {
  final useBottomSheet =
      MediaQuery.sizeOf(context).width < AppConstants.mobileBreakpoint;

  Widget buildPicker(BuildContext pickerContext) {
    return _SelectionPicker<T>(
      groupValue: selected,
      options: options,
      labelOf: labelOf,
      iconOf: iconOf,
      onChanged: (value) {
        Navigator.of(pickerContext).pop();
        onSelected(value);
      },
    );
  }

  if (useBottomSheet) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                child: Text(
                  title,
                  style: Theme.of(sheetContext).textTheme.titleLarge,
                ),
              ),
              buildPicker(sheetContext),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: 320,
          child: buildPicker(dialogContext),
        ),
      );
    },
  );
}

class _SelectionPicker<T> extends StatelessWidget {
  const _SelectionPicker({
    required this.groupValue,
    required this.options,
    required this.labelOf,
    required this.onChanged,
    this.iconOf,
  });

  final T groupValue;
  final List<T> options;
  final String Function(T) labelOf;
  final ValueChanged<T> onChanged;
  final Widget? Function(T)? iconOf;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<T>(
      groupValue: groupValue,
      onChanged: (value) {
        if (value == null) return;
        onChanged(value);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: options
            .map(
              (option) => RadioListTile<T>(
                title: Text(labelOf(option)),
                secondary: iconOf?.call(option),
                value: option,
              ),
            )
            .toList(),
      ),
    );
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
