import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/models/pokemon_summary.dart';
import 'package:flutter_pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:flutter_pokedex/shared/utils/image_utils.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class PokeItemWidget extends StatelessWidget {
  final PokemonSummary pokemon;
  final bool isFavorite;

  const PokeItemWidget({
    super.key,
    required this.pokemon,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: appColors.pokemonItem(pokemon.types[0]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned(
              bottom: -16,
              right: -8,
              child: CustomPaint(
                size: const Size(82, 82),
                painter: PokeballLogoPainter(
                  color: Colors.white.withOpacity(0.25),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 4),
                child: SizedBox(
                  height: 72,
                  width: 72,
                  child: Hero(
                    tag: isFavorite ? "favorite-pokemon-image-${pokemon.number}" : "pokemon-image-${pokemon.number}",
                    child: ImageUtils.networkImage(
                      imageURL: pokemon.thumbnailUrl,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 12),
                child: Text(
                  "#${pokemon.number}",
                  style: textTheme.titleMedium?.copyWith(
                    color: appColors.pokemonDetailsTitleColor.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: appColors.pokemonDetailsTitleColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.types
                        .map(
                          (type) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: appColors.pokemonDetailsTitleColor.withOpacity(0.4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                child: Text(
                                  type,
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontSize: 8,
                                    color: appColors.pokemonDetailsTitleColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
