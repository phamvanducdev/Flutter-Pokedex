import 'package:flutter/material.dart';
import 'package:pokedex/shared/extension/string_extension.dart';
import 'package:pokedex/shared/ui/widgets/pokemon_type_badge.dart';
import 'package:pokedex/theme/app_theme.dart';

class TypeEffectivenessWidget extends StatelessWidget {
  final String? type;
  final String? value;
  final bool? hasNone;

  const TypeEffectivenessWidget({
    super.key,
    this.type,
    this.value,
    this.hasNone = false,
  });

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    if (hasNone == false && (type == null || value == null)) {
      return Container();
    }
    return Column(
      children: [
        Container(
          width: 52,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: hasNone == true ? appColors.unknownIcon : appColors.pokemonItem(type),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (hasNone == false)
                PokemonTypeBadge(
                  type: type!,
                  height: 24,
                  width: 20,
                  showText: false,
                  showBorder: false,
                ),
              if (hasNone == false)
                Container(
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appColors.white.withOpacity(0.4),
                  ),
                  child: Text(
                    value!,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              if (hasNone == true)
                SizedBox(
                  width: 24,
                  child: Icon(
                    Icons.block,
                    color: appColors.venusIcon,
                  ),
                ),
            ],
          ),
        ),
        Text(
          hasNone! ? "NONE" : type.orEmpty,
          style: textTheme.bodySmall?.copyWith(
            fontSize: 8,
          ),
        )
      ],
    );
  }
}
