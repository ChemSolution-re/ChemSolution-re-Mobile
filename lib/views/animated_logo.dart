import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../resources/app_image_assets.dart';

class AnimatedLogo extends StatefulWidget {
  final double? height;

  const AnimatedLogo({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _rotationController;
  late final AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      lowerBound: 0.5,
      vsync: this,
    )..repeat(reverse: true);
    _rotationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    _scaleController = AnimationController(
      duration: const Duration(seconds: 2),
      lowerBound: 0.85,
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeController,
      builder: (_, __) {
        return Transform.scale(
          scale: _scaleController.value,
          child: Transform.rotate(
            angle: _rotationController.value * 2.0 * math.pi,
            child: Opacity(
              opacity: _fadeController.value,
              child: Image.asset(
                AppImageAssets.atom,
                height: widget.height,
              ),
            ),
          ),
        );
      },
    );
  }
}
