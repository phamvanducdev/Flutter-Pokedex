import 'package:flutter/material.dart';
import 'package:pokedex/modules/home/home_vm.dart';
import 'package:pokedex/modules/pokemons/pokemons_grid.dart';
import 'package:pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonsView extends StatefulWidget {
  final HomeViewModel viewModel;

  const PokemonsView({
    super.key,
    required this.viewModel,
  });

  @override
  State<PokemonsView> createState() => _PokemonsViewState();
}

class _PokemonsViewState extends State<PokemonsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: widget.viewModel.fetchPokemonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading...
          return SliverFillRemaining(
            child: Center(
              child: AnimatedPokeballWidget(
                size: 120,
                color: AppTheme.getColors(context).pokeballLogoGray,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // Failed
          return const SliverFillRemaining(
            child: Center(
              child: Text('Failed fetching data!'),
            ),
          );
        } else {
          // Success
          final pokemons = widget.viewModel.pokemons;
          return SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: PokemonsGridWidget(pokemons: pokemons),
          );
        }
      },
    );
  }
}
