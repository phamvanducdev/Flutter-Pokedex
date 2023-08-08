import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/utils/app_constants.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class PokemonTypeBadge extends StatelessWidget {
  final String type;
  final double height;
  final double width;
  final bool? showText;
  final bool? showBorder;

  const PokemonTypeBadge({
    super.key,
    required this.type,
    required this.height,
    required this.width,
    this.showText = true,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;
    var typeLogo = AppConstants.pokemonTypeLogo(type, width.toInt());

    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: appColors.pokemonItem(type),
            border: showBorder == true ? Border.all(color: appColors.black.withOpacity(0.4)) : null,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: width / 10,
              horizontal: width / 10,
            ),
            child: Image.asset(
              typeLogo,
              width: width,
              height: height,
            ),
          ),
        ),
        if (showText == true)
          SizedBox(
            child: Text(
              type,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 8,
              ),
            ),
          ),
      ],
    );
  }
}
