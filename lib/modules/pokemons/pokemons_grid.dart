import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_screen.dart';
import 'package:flutter_pokedex/modules/pokemons/pokemon_item.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';

class PokemonsGridWidget extends StatefulWidget {
  final List<PokemonSummary> pokemons;

  const PokemonsGridWidget({super.key, required this.pokemons});

  @override
  State<PokemonsGridWidget> createState() => _PokemonsGridWidgetState();
}

class _PokemonsGridWidgetState extends State<PokemonsGridWidget> {
  static const _pageSize = 20;

  final PagingController<int, Widget> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void _fetchPage(int pageKey) async {
    debugPrint('fetchPage => $pageKey');
    final maxRange = widget.pokemons.length;
    final initialRange = pageKey * _pageSize;
    final finalRange = (pageKey * _pageSize) + _pageSize > maxRange
        ? maxRange
        : (pageKey * _pageSize) + _pageSize;

    List<Widget> items = [];

    for (int index = initialRange; index < finalRange; index++) {
      final pokemon = widget.pokemons[index];

      items.add(_buildPokemonItem(index: index, pokemon: pokemon));

      _preCachePokemonImage(pokemon: pokemon);
    }

    if (maxRange == finalRange) {
      _pagingController.appendLastPage(items);
    } else {
      _pagingController.appendPage(items, pageKey + 1);
    }
  }

  void _preCachePokemonImage({required PokemonSummary pokemon}) {
    precacheImage(CachedNetworkImageProvider(pokemon.thumbnailUrl), context);
  }

  Widget _buildPokemonItem({
    required int index,
    required PokemonSummary pokemon,
  }) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return PokemonDetailScreen(
              index: index,
              pokemons: widget.pokemons,
            );
          }),
        );
      },
      child: Ink(
        child: PokeItemWidget(
          pokemon: pokemon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid<int, Widget>(
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      pagingController: _pagingController,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3 / 2,
      ),
      builderDelegate: PagedChildBuilderDelegate<Widget>(
        itemBuilder: (context, item, index) => item,
      ),
    );
  }
}
