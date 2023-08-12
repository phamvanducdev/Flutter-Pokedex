import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/evolution/widgets/evolution_chain_item.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class PreviousEvolutionChainWidget extends StatelessWidget {
  final Pokemon pokemon;
  final List<EvolutionChainItemWidget> evolutionChainItems;

  const PreviousEvolutionChainWidget({
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
          'Previous evolution${pokemon.previousEvolutions.length > 1 ? 's' : ''}',
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        ...evolutionChainItems
            .where((element) => element.previousEvolution.type.index.compareTo(pokemon.evolutionType.index) == -1)
            .toList(),
      ],
    );
  }
}
