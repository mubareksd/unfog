import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unfog/app/routes/route_name.dart';
import 'package:unfog/l10n/l10n.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _fogController;
  late final AnimationController _textController;
  late final AnimationController _glowController;

  late final Animation<double> _fogClearAnimation;
  late final Animation<double> _textBlurAnimation;
  late final Animation<double> _textOpacityAnimation;
  late final Animation<double> _textScaleAnimation;
  late final Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    // Fog clearing animation – runs over 2.5 seconds
    _fogController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _fogClearAnimation = CurvedAnimation(
      parent: _fogController,
      curve: Curves.easeInOut,
    );

    // Text reveal animation – starts slightly delayed
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Blur goes from 20 (fully blurred) to 0 (sharp)
    _textBlurAnimation = Tween<double>(begin: 20, end: 0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0, 0.7, curve: Curves.easeOut),
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.3, end: 1).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0, 0.6, curve: Curves.easeIn),
      ),
    );

    _textScaleAnimation = Tween<double>(begin: 0.92, end: 1).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );

    // Glow pulse behind the text
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _glowAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _glowController,
        curve: Curves.easeInOut,
      ),
    );

    // Orchestrate the sequence
    unawaited(_fogController.forward());

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) unawaited(_textController.forward());
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) unawaited(_glowController.forward());
    });

    // Navigate after the full animation completes
    unawaited(
      Future.delayed(const Duration(milliseconds: 3500), _navigateToExplore),
    );
  }

  void _navigateToExplore() {
    if (!mounted) return;
    context.go(RouteName.explore.path);
  }

  @override
  void dispose() {
    _fogController.dispose();
    _textController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0A0E1A) : Colors.white,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.2,
                colors: isDark
                    ? [
                        const Color(0xFF1A2340),
                        const Color(0xFF0A0E1A),
                      ]
                    : [
                        const Color(0xFFE8F0FE),
                        Colors.white,
                      ],
              ),
            ),
          ),

          // Glow effect behind text
          Center(
            child: AnimatedBuilder(
              animation: _glowAnimation,
              builder: (context, child) {
                return Container(
                  width: 250 + (_glowAnimation.value * 60),
                  height: 120 + (_glowAnimation.value * 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withValues(
                          alpha: 0.2 * _glowAnimation.value,
                        ),
                        blurRadius: 80 * _glowAnimation.value,
                        spreadRadius: 20 * _glowAnimation.value,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // "Unfog" text – starts blurry, becomes clear
          Center(
            child: AnimatedBuilder(
              animation: Listenable.merge([_textController, _glowController]),
              builder: (context, child) {
                return Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: Transform.scale(
                    scale: _textScaleAnimation.value,
                    child: ImageFiltered(
                      imageFilter: ui.ImageFilter.blur(
                        sigmaX: _textBlurAnimation.value,
                        sigmaY: _textBlurAnimation.value,
                      ),
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [
                              colorScheme.primary,
                              colorScheme.primary.withValues(
                                blue: min(
                                  1,
                                  colorScheme.primary.b + 0.15,
                                ),
                              ),
                              colorScheme.primary,
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          context.l10n.appTitle,
                          style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 2 + (_glowAnimation.value * 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Fog overlay – clears away over time
          AnimatedBuilder(
            animation: _fogClearAnimation,
            builder: (context, child) {
              return IgnorePointer(
                child: CustomPaint(
                  size: MediaQuery.sizeOf(context),
                  painter: _FogPainter(
                    clearProgress: _fogClearAnimation.value,
                    isDark: isDark,
                    primaryColor: colorScheme.primary,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Custom painter that draws animated fog particles that disperse as
/// [clearProgress] goes from 0.0 (fully fogged) to 1.0 (clear).
class _FogPainter extends CustomPainter {
  _FogPainter({
    required this.clearProgress,
    required this.isDark,
    required this.primaryColor,
  });

  final double clearProgress;
  final bool isDark;
  final Color primaryColor;

  // Pre-seeded random so fog pattern is deterministic per build
  static final _rng = Random(42);
  static List<_FogParticle>? _particles;

  static List<_FogParticle> _generateParticles(int count) {
    return List.generate(count, (i) {
      return _FogParticle(
        x: _rng.nextDouble(),
        y: _rng.nextDouble(),
        radius: 0.08 + _rng.nextDouble() * 0.18,
        drift: Offset(
          (_rng.nextDouble() - 0.5) * 2,
          (_rng.nextDouble() - 0.5) * 2,
        ),
        delay: _rng.nextDouble() * 0.3,
      );
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    _particles ??= _generateParticles(30);

    // Overall fog opacity fades as clearing progresses
    final fogOpacity = (1 - clearProgress).clamp(0.0, 1.0);

    if (fogOpacity <= 0.01) return;

    for (final p in _particles!) {
      // Each particle starts clearing after its individual delay
      final adjustedProgress = ((clearProgress - p.delay) / (1 - p.delay))
          .clamp(0.0, 1.0);

      // Particles drift outward as they fade
      final dx = p.x * size.width + p.drift.dx * adjustedProgress * 200;
      final dy = p.y * size.height + p.drift.dy * adjustedProgress * 200;

      final particleOpacity = (1 - adjustedProgress) * fogOpacity;
      if (particleOpacity <= 0.01) continue;

      final baseColor = isDark
          ? const Color(0xFF8899BB)
          : const Color(0xFFCCD6E8);

      final paint = Paint()
        ..color = baseColor.withValues(alpha: particleOpacity * 0.6)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          p.radius * size.width * (0.8 + adjustedProgress * 0.5),
        );

      canvas.drawCircle(
        Offset(dx, dy),
        p.radius * size.width,
        paint,
      );
    }

    // Add a subtle central fog veil that clears from center outward
    final veilOpacity = (1 - clearProgress * 1.3).clamp(0.0, 1.0);
    if (veilOpacity > 0.01) {
      final veilPaint = Paint()
        ..shader =
            RadialGradient(
              colors: [
                (isDark ? const Color(0xFF0A0E1A) : Colors.white).withValues(
                  alpha: veilOpacity * 0.9,
                ),
                (isDark ? const Color(0xFF0A0E1A) : Colors.white).withValues(
                  alpha: veilOpacity * 0.5,
                ),
                (isDark ? const Color(0xFF0A0E1A) : Colors.white).withValues(
                  alpha: 0,
                ),
              ],
              stops: const [0, 0.4, 1],
            ).createShader(
              Rect.fromCenter(
                center: Offset(size.width / 2, size.height / 2),
                width: size.width * (1.5 + clearProgress),
                height: size.height * (1.5 + clearProgress),
              ),
            );

      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        veilPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_FogPainter oldDelegate) =>
      clearProgress != oldDelegate.clearProgress;
}

class _FogParticle {
  const _FogParticle({
    required this.x,
    required this.y,
    required this.radius,
    required this.drift,
    required this.delay,
  });

  final double x;
  final double y;
  final double radius;
  final Offset drift;
  final double delay;
}
