import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unfog/app/routes/app_router.dart';
import 'package:unfog/core/constants/constants.dart';
import 'package:unfog/core/extensions/extensions.dart';
import 'package:unfog/l10n/l10n.dart';
import 'package:unfog/localizations/ti_cupertino_intl.dart';
import 'package:unfog/localizations/ti_material_intl.dart';
import 'package:unfog/localizations/ti_widgets_intl.dart';
import 'package:unfog/settings/settings.dart';

class App extends StatelessWidget {
  const App({required this.sharedPreferences, super.key});

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    final breakpoints = <Breakpoint>[
      const Breakpoint(
        start: 0,
        end: AppConstants.phoneBreakpoint,
        name: PHONE,
      ),
      const Breakpoint(
        start: AppConstants.phoneBreakpoint + 1,
        end: AppConstants.mobileBreakpoint,
        name: MOBILE,
      ),
      const Breakpoint(
        start: AppConstants.mobileBreakpoint + 1,
        end: AppConstants.tabletBreakpoint,
        name: TABLET,
      ),
      const Breakpoint(
        start: AppConstants.tabletBreakpoint + 1,
        end: double.infinity,
        name: DESKTOP,
      ),
    ];

    List<Condition<double>> getResponsiveWidth(BuildContext context) =>
        <Condition<double>>[
          const Condition<double>.equals(
            name: PHONE,
            value: AppConstants.phoneBreakpoint,
          ),
          const Condition<double>.equals(
            name: MOBILE,
            value: AppConstants.mobileBreakpoint,
          ),
          const Condition<double>.equals(
            name: TABLET,
            value: AppConstants.tabletBreakpoint,
          ),
          Condition<double>.equals(
            name: DESKTOP,
            value: context.screenWidth,
          ),
        ];

    final globalRepositoryProviders = <RepositoryProvider<Object>>[
      RepositoryProvider<SharedPreferences>.value(
        value: sharedPreferences,
      ),
    ];

    final globalBlocProviders = <BlocProvider<dynamic>>[
      BlocProvider<SettingsBloc>(
        create: (context) => SettingsBloc(
          sharedPreferences: sharedPreferences,
        )..add(LoadSettingsEvent()),
      ),
    ];

    return MultiRepositoryProvider(
      providers: globalRepositoryProviders,
      child: MultiBlocProvider(
        providers: globalBlocProviders,
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              builder: (context, child) => ResponsiveBreakpoints.builder(
                child: Builder(
                  builder: (context) => ResponsiveScaledBox(
                    width: ResponsiveValue<double>(
                      context,
                      defaultValue: AppConstants.mobileBreakpoint,
                      conditionalValues: getResponsiveWidth(
                        context,
                      ),
                    ).value,
                    child: child!,
                  ),
                ),
                breakpoints: breakpoints,
              ),
              themeMode: state.themeMode,
              locale: state.locale,
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFF0072FF),
                ),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFF0072FF),
                  brightness: Brightness.dark,
                ),
                useMaterial3: true,
              ),
              localizationsDelegates: const [
                ...AppLocalizations.localizationsDelegates,
                TiMaterialLocalizations.delegate,
                TiWidgetsLocalization.delegate,
                TiCupertinoLocalization.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
