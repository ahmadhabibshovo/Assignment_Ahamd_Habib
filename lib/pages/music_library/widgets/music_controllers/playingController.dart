import "package:assets_audio_player/assets_audio_player.dart";
import "package:assignment_app/pages/music_library/player/PlayingControls.dart";

PlayingControls playingContrller(
    LoopMode loopMode, bool isPlaying, assetsAudioPlayer) {
  return PlayingControls(
    loopMode: loopMode,
    isPlaying: isPlaying,
    isPlaylist: true,
    onStop: () {
      assetsAudioPlayer.stop();
    },
    toggleLoop: () {
      assetsAudioPlayer.toggleLoop();
    },
    onPlay: () {
      assetsAudioPlayer.playOrPause();
    },
    onNext: () {
      //_assetsAudioPlayer.forward(Duration(seconds: 10));
      assetsAudioPlayer.next(keepLoopMode: true /*keepLoopMode: false*/);
    },
    onPrevious: () {
      assetsAudioPlayer.previous(/*keepLoopMode: false*/);
    },
  );
}
