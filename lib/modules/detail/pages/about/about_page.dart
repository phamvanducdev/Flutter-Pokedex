import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pages/about/widget/sound_player.dart';
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: StreamBuilder<Pokemon?>(
              stream: widget.viewModel.streamPokemon,
              builder: (context, snapshot) {
                var descriptions = snapshot.data?.descriptions ?? [];
                return Column(
                  children: descriptions
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
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: StreamBuilder<Pokemon?>(
            stream: widget.viewModel.streamPokemon,
            builder: (context, snapshot) {
              var pokemon = snapshot.data;
              var soundURL = pokemon?.soundUrl;

              if (soundURL != null) {
                audioPlayer.setSourceUrl(soundURL);
                audioPlayer.pause();
                return SoundPlayerWidget(
                  soundURL: soundURL,
                  pokemonColor: appColors.pokemonItem(pokemon?.types[0]),
                  audioPlayer: audioPlayer,
                  viewModel: widget.viewModel,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
