import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';

class AnimatedPokeballWidget extends StatefulWidget {
  final Color color;
  final double size;

  const AnimatedPokeballWidget({
    super.key,
    required this.color,
    required this.size,
  });

  @override
  State<AnimatedPokeballWidget> createState() => _AnimatedPokeballWidgetState();
}

class _AnimatedPokeballWidgetState extends State<AnimatedPokeballWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: CustomPaint(
        size: Size(
          widget.size,
          widget.size,
        ),
        painter: PokeballLogoPainter(
          color: widget.color,
        ),
      ),
    );
  }
}
