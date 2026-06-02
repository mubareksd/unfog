import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unfog/l10n/l10n.dart';

class ScaffoldWithBottomNav extends StatelessWidget {
  const ScaffoldWithBottomNav({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final isExplore = navigationShell.currentIndex == 0;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: isExplore,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        backgroundColor: isExplore
            ? colorScheme.surface.withValues(alpha: 0.85)
            : null,
        surfaceTintColor: isExplore ? Colors.transparent : null,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.explore_outlined),
            selectedIcon: const Icon(Icons.explore),
            label: context.l10n.exploreTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: context.l10n.settingsTab,
          ),
        ],
      ),
    );
  }
}
