import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/about/widgets/animated_sprites.dart';
import 'package:flutter_pokedex/modules/detail/pages/about/widgets/breeding_info.dart';
import 'package:flutter_pokedex/modules/detail/pages/about/widgets/height_weight_info.dart';
import 'package:flutter_pokedex/modules/detail/pages/about/widgets/pokemon_cards.dart';
import 'package:flutter_pokedex/modules/detail/pages/about/widgets/sound_player.dart';
import 'package:flutter_pokedex/modules/detail/pages/about/widgets/training_info.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class AboutPage extends StatefulWidget {
  final PokemonDetailViewModel viewModel;

  const AboutPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.onDurationChanged.listen((state) {
      widget.viewModel.setAudioTotal(state);
    });
    audioPlayer.onPositionChanged.listen((state) {
      widget.viewModel.setAudioProgress(state);
    });
    audioPlayer.onPlayerComplete.listen((state) {
      widget.viewModel.setAudioProgress(Duration.zero);
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;
    var appColors = AppTheme.getColors(context);

    return StreamBuilder<Pokemon?>(
      stream: widget.viewModel.streamPokemon,
      builder: (context, snapshot) {
        var pokemon = snapshot.data;
        if (pokemon != null) {
          var soundURL = pokemon.soundUrl;
          if (soundURL != null) {
            audioPlayer.setSourceUrl(soundURL);
            audioPlayer.pause();
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: Column(
                  children: pokemon.descriptions
                      .map(
                        (description) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            description,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              if (soundURL != null)
                SoundPlayerWidget(
                  soundURL: soundURL,
                  pokemonColor: appColors.pokemonItem(pokemon.types[0]),
                  audioPlayer: audioPlayer,
                  viewModel: widget.viewModel,
                ),
              if (pokemon.hasAnimatedSprites)
                AnimatedSpritesWidget(
                  isShiny: false,
                  pokemon: pokemon,
                ),
              if (pokemon.hasAnimatedShinySprites)
                AnimatedSpritesWidget(
                  isShiny: true,
                  pokemon: pokemon,
                ),
              HeightWeightInfoWidget(pokemon: pokemon),
              BreedingInfoWidget(pokemon: pokemon),
              TrainingInfoWidget(pokemon: pokemon),
              PokemonCardsWidget(pokemon: pokemon),
              Container(height: 240),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
