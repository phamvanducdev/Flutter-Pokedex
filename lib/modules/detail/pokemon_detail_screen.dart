import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:flutter_pokedex/modules/detail/widgets/app_bar.dart';
import 'package:flutter_pokedex/modules/detail/widgets/pokemon_info.dart';
import 'package:flutter_pokedex/modules/detail/pages/pokemon_detail_pager.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';

class PokemonDetailScreen extends StatefulWidget {
  final int index;
  final List<PokemonSummary> pokemons;

  const PokemonDetailScreen({
    super.key,
    required this.index,
    required this.pokemons,
  });

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  PokemonDetailViewModel viewModel = GetIt.instance<PokemonDetailViewModel>();

  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.index,
      viewportFraction: 0.42,
    );
    viewModel.initial(widget.index, widget.pokemons);
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.fetchPokemonDetail(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarWidget(
              viewModel: viewModel,
              onBackListener: () => Navigator.of(context).pop(),
              onFavoriteListener: (favorited) => viewModel.onFavorite(favorited),
              onNextListener: () {
                pageController?.nextPage(
                  duration: const Duration(microseconds: 300),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              },
              onFreviousListener: () {
                pageController?.previousPage(
                  duration: const Duration(microseconds: 300),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              },
            ),
          ),
          body: Stack(
            children: [
              PokemonInfoWidget(
                viewModel: viewModel,
                pageController: pageController,
              ),
              PokemonDetailPagerWidget(
                viewModel: viewModel,
                onListener: (progress) {
                  viewModel.setOpacityProgress(progress);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
