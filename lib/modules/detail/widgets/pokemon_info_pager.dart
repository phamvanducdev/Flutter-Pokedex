import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';
import 'package:flutter_pokedex/shared/utils/image_utils.dart';

class PokemonInfoPagerWidget extends StatefulWidget {
  final PokemonSummary pokemon;
  final List<PokemonSummary> pokemons;
  final PageController? pageController;

  final Function(int) onPageChanged;

  const PokemonInfoPagerWidget({
    super.key,
    required this.pokemon,
    required this.pokemons,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  State<PokemonInfoPagerWidget> createState() => _PokemonInfoPagerWidgetState();
}

class _PokemonInfoPagerWidgetState extends State<PokemonInfoPagerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: PageView.builder(
        controller: widget.pageController,
        itemCount: widget.pokemons.length,
        onPageChanged: widget.onPageChanged,
        allowImplicitScrolling: true,
        itemBuilder: (context, index) {
          final currentPokemon = widget.pokemons[index];
          return AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(
              currentPokemon.number != widget.pokemon.number ? 32 : 0,
            ),
            child: ImageUtils.networkImage(
              url: currentPokemon.imageUrl,
              color: currentPokemon.number != widget.pokemon.number ? Colors.black.withOpacity(0.2) : null,
            ),
          );
        },
      ),
    );
  }
}
