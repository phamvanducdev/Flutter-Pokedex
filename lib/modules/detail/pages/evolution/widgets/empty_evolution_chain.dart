import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class EmptyEvolutionChainWidget extends StatelessWidget {
  final String pokemonName;
  final String pokemonType;
  final String pokemonImageURL;

  const EmptyEvolutionChainWidget({
    super.key,
    required this.pokemonName,
    required this.pokemonType,
    required this.pokemonImageURL,
  });

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        Center(
          child: ImageUtils.networkImage(
            imageURL: pokemonImageURL,
            color: appColors.pokemonItem(pokemonType).withOpacity(0.5),
            width: 120,
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          style: textTheme.bodyLarge?.copyWith(
            color: appColors.black.withOpacity(0.6),
          ),
          TextSpan(
            children: [
              TextSpan(
                text: pokemonName,
                style: textTheme.bodyLarge?.copyWith(
                  color: appColors.pokemonItem(pokemonType),
                ),
              ),
              const TextSpan(text: ' does not have any evolution chain.')
            ],
          ),
        ),
      ],
    );
  }
}
