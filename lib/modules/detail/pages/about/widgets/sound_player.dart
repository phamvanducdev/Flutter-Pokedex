import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/detail/pokemon_detail_vm.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class AudioDurations {
  final Duration total;
  final Duration progress;

  AudioDurations({
    required this.total,
    required this.progress,
  });
}

class SoundPlayerWidget extends StatelessWidget {
  final String soundURL;
  final Color pokemonColor;
  final AudioPlayer audioPlayer;
  final PokemonDetailViewModel viewModel;

  const SoundPlayerWidget({
    super.key,
    required this.soundURL,
    required this.pokemonColor,
    required this.audioPlayer,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: appColors.panelBackground,
          borderRadius: BorderRadius.circular(50),
        ),
        child: StreamBuilder<AudioDurations>(
          stream: viewModel.streamAudio,
          builder: (context, snapshot) {
            var total = snapshot.data?.total ?? Duration.zero;
            var progress = snapshot.data?.progress ?? Duration.zero;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () async {
                    audioPlayer.seek(Duration.zero);
                    audioPlayer.play(UrlSource(soundURL));
                  },
                  icon: progress == total || progress == Duration.zero
                      ? const Icon(Icons.play_arrow)
                      : const Icon(Icons.pause),
                  color: pokemonColor,
                ),
                Expanded(
                  child: ProgressBar(
                    total: total,
                    progress: progress,
                    progressBarColor: pokemonColor,
                    baseBarColor: pokemonColor.withOpacity(0.1),
                    bufferedBarColor: pokemonColor.withOpacity(0.1),
                    thumbColor: pokemonColor,
                    timeLabelLocation: TimeLabelLocation.sides,
                    onSeek: (duration) {
                      audioPlayer.seek(duration);
                    },
                  ),
                ),
                const SizedBox(width: 12)
              ],
            );
          },
        ),
      ),
    );
  }
}
