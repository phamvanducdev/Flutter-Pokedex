import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/shared/utils/evolution_chain_utils.dart';
import 'package:flutter_pokedex/shared/utils/image_utils.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class SupperEvolutionChainWidget extends StatelessWidget {
  final Pokemon pokemon;

  const SupperEvolutionChainWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;

    var megaEvolutionChains = EvolutionChainUtils.getSuperEvolutionChain(pokemon);

    return Column(
      children: [
        if (pokemon.megaEvolutions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  'Mega evolution${pokemon.megaEvolutions.length > 1 ? 's' : ''}',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...megaEvolutionChains,
              ],
            ),
          ),
        if (pokemon.gigantamaxEvolutions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              children: [
                Text(
                  'Gigantamax evolution${pokemon.megaEvolutions.length > 1 ? 's' : ''}',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...pokemon.gigantamaxEvolutions.map(
                  (gigantamax) => Center(
                    child: Column(
                      children: [
                        ImageUtils.networkImage(
                          imageURL: gigantamax.imageUrl,
                          width: 240,
                        ),
                        Text(
                          gigantamax.name,
                          style: textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
