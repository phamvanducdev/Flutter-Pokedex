import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:flutter_pokedex/shared/utils/image_utils.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class SuperEvolutionChainItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final SuperEvolution superEvolution;

  const SuperEvolutionChainItemWidget({
    super.key,
    required this.pokemon,
    required this.superEvolution,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;
    var appColors = AppTheme.getColors(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 84,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 84,
                      height: 84,
                      child: CustomPaint(
                        painter: PokeballLogoPainter(
                          color: appColors.pokeballLogoGray,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 72,
                      height: 72,
                      child: ImageUtils.networkImage(
                        imageURL: pokemon.imageUrl,
                      ),
                    )
                  ],
                ),
                Text(
                  pokemon.name,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            child: Icon(Icons.arrow_forward),
          ),
          SizedBox(
            width: 84,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 84,
                      height: 84,
                      child: CustomPaint(
                        painter: PokeballLogoPainter(
                          color: appColors.pokeballLogoGray,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 72,
                      height: 72,
                      child: ImageUtils.networkImage(
                        imageURL: superEvolution.imageUrl,
                      ),
                    )
                  ],
                ),
                Text(
                  superEvolution.name,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
