import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/theme/app_theme.dart';

class HeightWeightInfoWidget extends StatelessWidget {
  final Pokemon pokemon;

  const HeightWeightInfoWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: appColors.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: appColors.black.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Height",
                  style: textTheme.bodyLarge?.copyWith(
                    color: appColors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  pokemon.height,
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Weight",
                  style: textTheme.bodyLarge?.copyWith(
                    color: appColors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  pokemon.weight,
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
