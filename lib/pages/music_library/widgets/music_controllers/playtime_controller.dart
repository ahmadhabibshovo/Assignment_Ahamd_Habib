import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assignment_app/pages/music_library/player/PositionSeekWidget.dart';
import 'package:flutter/material.dart';

Column playtime_Controller(RealtimePlayingInfos infos, _assetsAudioPlayer) {
  return Column(
    children: [
      PositionSeekWidget(
        currentPosition: infos.currentPosition,
        duration: infos.duration,
        seekTo: (to) {
          _assetsAudioPlayer.seek(to);
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _assetsAudioPlayer.seekBy(const Duration(seconds: -10));
            },
            child: const Text('-10s'),
          ),
          const SizedBox(
            width: 12,
          ),
          ElevatedButton(
            onPressed: () {
              _assetsAudioPlayer.seekBy(const Duration(seconds: 10));
            },
            child: const Text('+10s'),
          ),
        ],
      )
    ],
  );
}
