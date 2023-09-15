import 'package:flutter/material.dart';
import 'package:pokedex/shared/extension/string_extension.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class AnimatedSpritesWidget extends StatelessWidget {
  final bool isShiny;
  final Pokemon? pokemon;

  const AnimatedSpritesWidget({
    super.key,
    required this.isShiny,
    required this.pokemon,
  });

  String get frontTitle => isShiny ? "Front animated\nshiny sprite" : "Front animated\nsprite";
  String get backTitle => isShiny ? "Back animated\nshiny sprite" : "Back animated\nsprite";

  Sprites? get sprites => pokemon?.sprites;
  String? get frontURL => isShiny ? sprites?.frontShinyAnimatedSpriteUrl : sprites?.frontAnimatedSpriteUrl;
  String? get backURL => isShiny ? sprites?.backShinyAnimatedSpriteUrl : sprites?.backAnimatedSpriteUrl;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = AppTheme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              ImageUtils.networkImage(
                height: 64,
                width: 64,
                imageURL: frontURL.orEmpty,
              ),
              Text(
                frontTitle,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              ImageUtils.networkImage(
                height: 64,
                width: 64,
                imageURL: backURL.orEmpty,
              ),
              Text(
                backTitle,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
