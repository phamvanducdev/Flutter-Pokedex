import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_theme.dart';

class BaseStatsItemWidget extends StatelessWidget {
  final String title;
  final int value;
  final int maxValue;

  const BaseStatsItemWidget({
    super.key,
    required this.title,
    required this.value,
    this.maxValue = 200,
  });

  double get barPercentage => value / maxValue;

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 86,
            child: Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                color: appColors.black.withOpacity(0.4),
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              value.toString(),
              style: textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: appColors.black.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: barPercentage,
                  child: AnimatedContainer(
                    key: Key(title),
                    duration: const Duration(seconds: 3),
                    height: 10,
                    decoration: BoxDecoration(
                      color: appColors.baseStatusBar(barPercentage),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
