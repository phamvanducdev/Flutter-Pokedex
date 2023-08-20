import 'package:flutter/material.dart';
import 'package:pokedex/modules/detail/pages/evolution/widgets/empty_evolution_chain.dart';
import 'package:pokedex/modules/detail/pages/evolution/widgets/next_evolution_chain.dart';
import 'package:pokedex/modules/detail/pages/evolution/widgets/previous_evolution_chain.dart';
import 'package:pokedex/modules/detail/pages/evolution/widgets/supper_evolution_chain.dart';
import 'package:pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/utils/evolution_chain_utils.dart';

class EvolutionPage extends StatelessWidget {
  final PokemonDetailViewModel viewModel;

  const EvolutionPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Pokemon?>(
      stream: viewModel.streamPokemon,
      builder: (context, snapshot) {
        var pokemon = snapshot.data;

        if (pokemon == null) return Container();

        var evolutionChainItems = EvolutionChainUtils.getEvolutionChain(pokemon);

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 32,
          ),
          child: Column(
            children: [
              if (pokemon.previousEvolutions.isNotEmpty)
                PreviousEvolutionChainWidget(
                  pokemon: pokemon,
                  evolutionChainItems: evolutionChainItems,
                ),
              if (pokemon.nextEvolutions.isNotEmpty)
                NextEvolutionChainWidget(
                  pokemon: pokemon,
                  evolutionChainItems: evolutionChainItems,
                ),
              if (pokemon.megaEvolutions.isNotEmpty)
                SupperEvolutionChainWidget(
                  pokemon: pokemon,
                ),
              if (!pokemon.hasEvolutions)
                EmptyEvolutionChainWidget(
                  pokemonName: pokemon.name,
                  pokemonType: pokemon.types[0],
                  pokemonImageURL: pokemon.imageUrl,
                ),
              const SizedBox(height: 120),
            ],
          ),
        );
      },
    );
  }
}
