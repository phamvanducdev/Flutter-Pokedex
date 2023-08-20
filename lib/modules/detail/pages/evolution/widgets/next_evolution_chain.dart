import 'package:flutter/material.dart';
import 'package:pokedex/modules/detail/pages/evolution/widgets/evolution_chain_item.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/theme/app_theme.dart';

class NextEvolutionChainWidget extends StatelessWidget {
  final Pokemon pokemon;
  final List<EvolutionChainItemWidget> evolutionChainItems;

  const NextEvolutionChainWidget({
    super.key,
    required this.pokemon,
    required this.evolutionChainItems,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;

    return Column(
      children: [
        Text(
          'Next evolution${pokemon.nextEvolutions.length > 1 ? 's' : ''}',
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        ...evolutionChainItems
            .where((element) => element.previousEvolution.type.index.compareTo(pokemon.evolutionType.index) >= 0)
            .toList(),
      ],
    );
  }
}
