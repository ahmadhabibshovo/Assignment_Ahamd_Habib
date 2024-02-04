import "package:assets_audio_player/assets_audio_player.dart";
import "package:assignment_app/pages/music_library/audios/audios.dart";
import "package:flutter/material.dart";

Audio find(List<Audio> source, String fromPath) {
  return source.firstWhere((element) => element.path == fromPath);
}

Stack MusicPlayer(audioPlayer) {
  return Stack(
    fit: StackFit.passthrough,
    children: <Widget>[
      StreamBuilder<Playing?>(
          stream: audioPlayer.current,
          builder: (context, playing) {
            if (playing.data != null) {
              final myAudio = find(audios, playing.data!.audio.assetAudioPath);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: myAudio.metas.image?.path == null
                      ? const SizedBox()
                      : myAudio.metas.image?.type == ImageType.network
                          ? Image.network(
                              myAudio.metas.image!.path,
                              height: 150,
                              width: 150,
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              myAudio.metas.image!.path,
                              height: 150,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
    ],
  );
}
