import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:flutter_pokedex/modules/detail/widgets/app_bar_background.dart';
import 'package:flutter_pokedex/modules/detail/widgets/app_bar_navigation.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  final PokemonDetailViewModel viewModel;

  final Function() onBackListener;
  final Function(bool) onFavoriteListener;

  final Function() onNextListener;
  final Function() onFreviousListener;

  const AppBarWidget({
    super.key,
    required this.viewModel,
    required this.onBackListener,
    required this.onFavoriteListener,
    required this.onNextListener,
    required this.onFreviousListener,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppTheme.getColors(context);

    return StreamBuilder<PokemonSummary>(
      stream: viewModel.streamPokemonSummary,
      builder: (context, snapshot) {
        var pokemon = snapshot.data ?? viewModel.currentPokemon;

        return Stack(
          children: [
            AppBarBackgroundWidget(
              backgroundColor: appColors.pokemonItem(pokemon.types[0]),
            ),
            AppBar(
              title: StreamBuilder<double>(
                stream: viewModel.streamAppbarOpacity,
                builder: (context, snapshot) {
                  return AppBarNavigationWidget(
                    opacity: snapshot.data ?? 0,
                    pokemonName: pokemon.name,
                    nextPokemonEnable: viewModel.nextPokemonEnable,
                    previousPokemonEnable: viewModel.previousPokemonEnable,
                    onNextListener: onNextListener,
                    onFreviousListener: onFreviousListener,
                  );
                },
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: appColors.pokemonDetailsTitleColor,
                  size: 22,
                ),
                onPressed: onBackListener,
              ),
              actions: [
                StreamBuilder<bool>(
                  stream: viewModel.streamFavoritedPokemon,
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: appColors.pokemonDetailsTitleColor,
                          size: 22,
                        ),
                        onPressed: () {
                          onFavoriteListener(false);
                        },
                      );
                    } else {
                      return IconButton(
                        icon: Icon(
                          Icons.favorite_outline,
                          color: appColors.pokemonDetailsTitleColor,
                          size: 22,
                        ),
                        onPressed: () {
                          onFavoriteListener(true);
                        },
                      );
                    }
                  },
                ),
              ],
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
          ],
        );
      },
    );
  }
}
