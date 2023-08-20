import 'package:flutter/material.dart';
import 'package:pokedex/shared/extension/string_extension.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class EvolutionChainItemWidget extends StatelessWidget {
  final EvolutionChain previousEvolution;
  final EvolutionChain nextEvolution;

  const EvolutionChainItemWidget({
    super.key,
    required this.previousEvolution,
    required this.nextEvolution,
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
                        imageURL: previousEvolution.imageUrl,
                      ),
                    )
                  ],
                ),
                Text(
                  previousEvolution.name,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '#${previousEvolution.number}',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 12,
                    color: appColors.black.withOpacity(0.4),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Icon(Icons.arrow_forward),
              SizedBox(
                width: 80,
                child: Text(
                  nextEvolution.requirement.orEmpty,
                  style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
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
                        imageURL: nextEvolution.imageUrl,
                      ),
                    )
                  ],
                ),
                Text(
                  nextEvolution.name,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '#${nextEvolution.number}',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 12,
                    color: appColors.black.withOpacity(0.4),
                  ),
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
