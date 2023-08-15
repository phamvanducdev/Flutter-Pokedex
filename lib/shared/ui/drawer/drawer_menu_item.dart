import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/theme/app_theme.dart';

class DrawerMenuItemWidget extends StatelessWidget {
  final String itemText;
  final Color itemColor;
  final VoidCallback? onTapListener;

  const DrawerMenuItemWidget({
    super.key,
    required this.itemText,
    required this.itemColor,
    this.onTapListener,
  });

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 4,
      ),
      child: InkWell(
        onTap: onTapListener,
        child: Container(
          decoration: BoxDecoration(
            color: itemColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: -12,
                  child: CustomPaint(
                    painter: PokeballLogoPainter(
                      color: appColors.white.withOpacity(0.2),
                    ),
                    size: const Size(64, 64),
                  ),
                ),
                Positioned(
                  top: -42,
                  left: -42,
                  child: CustomPaint(
                    painter: PokeballLogoPainter(
                      color: appColors.white.withOpacity(0.2),
                    ),
                    size: const Size(64, 64),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      child: Text(
                        itemText,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          color: appColors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
