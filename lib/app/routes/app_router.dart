import 'package:go_router/go_router.dart';
import 'package:unfog/app/routes/app_routes.dart';
import 'package:unfog/app/routes/route_name.dart';
import 'package:unfog/app/routes/route_navigator_keys.dart';

/// App-wide router — must be a single instance so rebuilds (e.g. hot reload,
/// theme/locale changes) do not reset navigation to [RouteName.initial].
abstract final class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: RouteNavigatorKeys.root,
    initialLocation: RouteName.initial.path,
    routes: AppRoutes.routes,
  );
}
