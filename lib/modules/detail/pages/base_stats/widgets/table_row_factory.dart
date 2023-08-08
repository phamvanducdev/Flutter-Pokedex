import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/base_stats/widgets/type_effectiveness_badge.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class TableRowFactory {
  static TableRow build(
    BuildContext context, {
    required String title,
    required Iterable<MapEntry<String, String>> types,
  }) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: textTheme.bodyLarge?.copyWith(
              color: appColors.black.withOpacity(0.4),
            ),
          ),
        ),
        if (types.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Wrap(
              children: types
                  .map(
                    (type) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 4,
                      ),
                      child: TypeEffectivenessWidget(
                        type: type.key,
                        value: type.value,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        if (types.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Wrap(
              children: const [
                TypeEffectivenessWidget(
                  hasNone: true,
                ),
              ],
            ),
          )
      ],
    );
  }
}
