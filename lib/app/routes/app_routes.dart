import 'package:go_router/go_router.dart';
import 'package:unfog/app/routes/route_name.dart';
import 'package:unfog/app/view/scaffold_with_bottom_nav.dart';
import 'package:unfog/explore/explore.dart';
import 'package:unfog/settings/view/settings_page.dart';
import 'package:unfog/splash/splash.dart';

abstract final class AppRoutes {
  static List<RouteBase> get routes => <RouteBase>[
    GoRoute(
      path: RouteName.initial.path,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SplashPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ScaffoldWithBottomNav(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteName.explore.path,
              builder: (context, state) => const ExplorePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteName.settings.path,
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ];
}
