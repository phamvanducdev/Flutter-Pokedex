import 'package:flutter_pokedex/modules/detail/pages/evolution/widgets/evolution_chain_item.dart';
import 'package:flutter_pokedex/modules/detail/pages/evolution/widgets/supper_evolution_chain_item.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';

class EvolutionChainUtils {
  static List<EvolutionChainItemWidget> getEvolutionChain(Pokemon pokemon) {
    List<EvolutionChainItemWidget> evolutionChainWidgetList = [];

    if (pokemon.middleEvolutions.isEmpty && pokemon.lastEvolutions.isEmpty) {
      return evolutionChainWidgetList;
    }

    if (pokemon.middleEvolutions.isNotEmpty) {
      for (var middleEvolution in pokemon.middleEvolutions) {
        var evolutionChainItemWidget = EvolutionChainItemWidget(
          previousEvolution: pokemon.firstEvolution,
          nextEvolution: middleEvolution,
        );

        evolutionChainWidgetList.add(evolutionChainItemWidget);
      }
    }

    if (pokemon.lastEvolutions.isNotEmpty) {
      if (pokemon.middleEvolutions.isEmpty) {
        for (var lastEvolution in pokemon.lastEvolutions) {
          var evolutionChainItemWidget = EvolutionChainItemWidget(
            previousEvolution: pokemon.firstEvolution,
            nextEvolution: lastEvolution,
          );

          evolutionChainWidgetList.add(evolutionChainItemWidget);
        }
      } else {
        for (var lastEvolution in pokemon.lastEvolutions) {
          for (var middleEvolution in pokemon.middleEvolutions) {
            var evolutionChainItemWidget = EvolutionChainItemWidget(
              previousEvolution: middleEvolution,
              nextEvolution: lastEvolution,
            );

            evolutionChainWidgetList.add(evolutionChainItemWidget);
          }
        }
      }
    }

    return evolutionChainWidgetList;
  }

  static List<SuperEvolutionChainItemWidget> getSuperEvolutionChain(Pokemon pokemon) {
    List<SuperEvolutionChainItemWidget> evolutionChainWidgetList = [];

    if (pokemon.superEvolutions.isEmpty) {
      return evolutionChainWidgetList;
    }

    if (pokemon.megaEvolutions.isNotEmpty) {
      for (var megaEvolution in pokemon.megaEvolutions) {
        var evolutionChainItemWidget = SuperEvolutionChainItemWidget(
          pokemon: pokemon,
          superEvolution: megaEvolution,
        );

        evolutionChainWidgetList.add(evolutionChainItemWidget);
      }
    }

    return evolutionChainWidgetList;
  }
}
