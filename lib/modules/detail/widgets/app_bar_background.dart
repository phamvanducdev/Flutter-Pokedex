import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/canvas/background_dots.dart';

class AppBarBackgroundWidget extends StatelessWidget {
  final Color backgroundColor;

  const AppBarBackgroundWidget({
    super.key,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;

    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: backgroundColor,
        ),
        Positioned(
          top: -94 + padding.top,
          left: -72,
          child: Transform.rotate(
            angle: 75,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                height: 142,
                width: 142,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 82,
          top: padding.top,
          child: Opacity(
            opacity: 0.2,
            child: CustomPaint(
              size: const Size(56, 32),
              painter: BackgroundDotsPainter(),
            ),
          ),
        ),
      ],
    );
  }
}
