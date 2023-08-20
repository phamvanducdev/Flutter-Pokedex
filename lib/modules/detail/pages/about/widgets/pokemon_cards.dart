import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonCardsWidget extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCardsWidget({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonCardsWidget> createState() => _PokemonCardsWidgetState();
}

class _PokemonCardsWidgetState extends State<PokemonCardsWidget> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.5);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = AppTheme.of(context).textTheme;
    var appColors = AppTheme.getColors(context);

    var pokemon = widget.pokemon;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "${pokemon.name} Cards",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 320,
                width: size.width,
                child: PageView.builder(
                  controller: _pageController,
                  allowImplicitScrolling: true,
                  itemCount: pokemon.cards.length,
                  itemBuilder: (context, index) {
                    var card = pokemon.cards[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.fromBorderSide(
                                BorderSide(
                                  color: appColors.tabDivisor,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: appColors.black.withOpacity(0.1),
                                  blurRadius: 4.0,
                                  spreadRadius: 3.0,
                                  offset: const Offset(0.0, 4.0),
                                ),
                              ]),
                          child: ImageUtils.networkImage(imageURL: card.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${card.number} - ${card.name}",
                                style: textTheme.bodyLarge,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  card.expansionName,
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
