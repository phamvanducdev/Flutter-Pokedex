import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_theme.dart';

class AppBarNavigationWidget extends StatelessWidget {
  final double opacity;
  final String pokemonName;

  final bool nextPokemonEnable;
  final bool previousPokemonEnable;

  final Function() onNextListener;
  final Function() onFreviousListener;

  const AppBarNavigationWidget({
    super.key,
    required this.opacity,
    required this.pokemonName,
    required this.nextPokemonEnable,
    required this.previousPokemonEnable,
    required this.onNextListener,
    required this.onFreviousListener,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;
    var appColors = AppTheme.getColors(context);

    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (previousPokemonEnable)
            GestureDetector(
              onTap: onFreviousListener,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: appColors.pokemonDetailsTitleColor,
                size: 18,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ),
            child: Text(
              pokemonName,
              style: textTheme.headlineSmall?.copyWith(
                color: appColors.pokemonDetailsTitleColor,
              ),
            ),
          ),
          if (nextPokemonEnable)
            GestureDetector(
              onTap: onNextListener,
              child: Icon(
                Icons.arrow_forward_ios,
                color: appColors.pokemonDetailsTitleColor,
                size: 18,
              ),
            ),
        ],
      ),
    );
  }
}
