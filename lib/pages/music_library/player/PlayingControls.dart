import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'asset_audio_player_icons.dart';

class PlayingControls extends StatelessWidget {
  final bool isPlaying;
  final LoopMode? loopMode;
  final bool isPlaylist;
  final Function()? onPrevious;
  final Function() onPlay;
  final Function()? onNext;
  final Function()? toggleLoop;
  final Function()? onStop;

  const PlayingControls({super.key, 
    required this.isPlaying,
    this.isPlaylist = false,
    this.loopMode,
    this.toggleLoop,
    this.onPrevious,
    required this.onPlay,
    this.onNext,
    this.onStop,
  });

  Widget _loopIcon(BuildContext context) {
    const iconSize = 34.0;
    if (loopMode == LoopMode.none) {
      return const Icon(
        Icons.loop,
        size: iconSize,
        color: Colors.grey,
      );
    } else if (loopMode == LoopMode.playlist) {
      return const Icon(
        Icons.loop,
        size: iconSize,
        color: Colors.black,
      );
    } else {
      //single
      return Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.loop,
            size: iconSize,
            color: Theme.of(context).primaryColor,
          ),
          const Center(
            child: Text(
              '1',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            if (toggleLoop != null) toggleLoop!();
          },
          child: _loopIcon(context),
        ),
        const SizedBox(
          width: 12,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: isPlaylist ? onPrevious : null,
          child: const Icon(AssetAudioPlayerIcons.to_start),
        ),
        const SizedBox(
          width: 12,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onPlay,
          child: Icon(
            isPlaying
                ? AssetAudioPlayerIcons.pause
                : AssetAudioPlayerIcons.play,
            size: 32,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: isPlaylist ? onNext : null,
          child: const Icon(AssetAudioPlayerIcons.to_end),
        ),
        const SizedBox(
          width: 45,
        ),
      ],
    );
  }
}
