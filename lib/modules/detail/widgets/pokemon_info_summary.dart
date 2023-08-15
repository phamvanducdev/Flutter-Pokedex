import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonInfoSummaryWidget extends StatelessWidget {
  final PokemonSummary pokemon;

  const PokemonInfoSummaryWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;
    var appColors = AppTheme.getColors(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemon.name,
                style: textTheme.displayMedium?.copyWith(
                  fontSize: 32,
                  color: appColors.pokemonDetailsTitleColor,
                ),
              ),
              Text(
                '#${pokemon.number}',
                style: textTheme.headlineSmall?.copyWith(
                  color: appColors.pokemonDetailsTitleColor.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: pokemon.types
                    .map(
                      (type) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: AppTheme.getColors(context).pokemonDetailsTitleColor.withOpacity(0.4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Text(
                              type,
                              style: textTheme.bodyLarge?.copyWith(
                                color: appColors.pokemonDetailsTitleColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Text(
                '${pokemon.specie} Pokemon',
                style: textTheme.bodyLarge?.copyWith(
                  color: appColors.pokemonDetailsTitleColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
