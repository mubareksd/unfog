enum RouteName {
  initial('/'),
  explore('/explore'),
  settings('/settings');

  const RouteName(this.path);
  final String path;
}
