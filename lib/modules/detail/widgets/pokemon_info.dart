import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:flutter_pokedex/modules/detail/widgets/pokemon_info_pager.dart';
import 'package:flutter_pokedex/modules/detail/widgets/pokemon_info_summary.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';
import 'package:flutter_pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class PokemonInfoWidget extends StatefulWidget {
  final PokemonDetailViewModel viewModel;
  final PageController? pageController;

  const PokemonInfoWidget({
    super.key,
    required this.viewModel,
    required this.pageController,
  });

  @override
  State<PokemonInfoWidget> createState() => _PokemonInfoWidgetState();
}

class _PokemonInfoWidgetState extends State<PokemonInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appColors = AppTheme.getColors(context);

    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Row(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    StreamBuilder<PokemonSummary>(
                      stream: widget.viewModel.streamPokemonSummary,
                      builder: (context, snapshot) {
                        var pokemon = snapshot.data ?? widget.viewModel.currentPokemon;
                        return Container(
                          color: appColors.pokemonItem(pokemon.types[0]),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          color: appColors.backgroundColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                          height: 240,
                          child: Center(
                            child: AnimatedPokeballWidget(
                              size: 200,
                              color: appColors.backgroundColor.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder<double>(
                        stream: widget.viewModel.streamAppbarOpacity,
                        builder: (context, snapshot) {
                          return AnimatedOpacity(
                            opacity: 1 - (snapshot.data ?? 0),
                            duration: const Duration(milliseconds: 30),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: StreamBuilder<PokemonSummary>(
                                    stream: widget.viewModel.streamPokemonSummary,
                                    builder: (context, snapshot) {
                                      var pokemon = snapshot.data ?? widget.viewModel.currentPokemon;
                                      return PokemonInfoSummaryWidget(
                                        pokemon: pokemon,
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: SizedBox(
                                      height: 240,
                                      child: StreamBuilder<PokemonSummary>(
                                          stream: widget.viewModel.streamPokemonSummary,
                                          builder: (context, snapshot) {
                                            var pokemon = snapshot.data ?? widget.viewModel.currentPokemon;
                                            return PokemonInfoPagerWidget(
                                              pokemon: pokemon,
                                              pokemons: widget.viewModel.pokemonsSummary,
                                              pageController: widget.pageController,
                                              onPageChanged: (index) => widget.viewModel.onPageChanged(index),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            width: size.width,
            height: size.height,
          ),
        ),
      ],
    );
  }
}
