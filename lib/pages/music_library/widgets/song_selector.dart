import "package:assets_audio_player/assets_audio_player.dart";
import "package:assignment_app/pages/music_library/audios/audios.dart";
import 'package:assignment_app/pages/music_library/player/SongsSelector.dart';

SongsSelector songsSelector(audioPlayer, Playing? playing) {
  return SongsSelector(
    audios: audios,
    onPlaylistSelected: (myAudios) {
      audioPlayer.open(
        Playlist(audios: myAudios),
        showNotification: true,
        headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
        audioFocusStrategy:
            const AudioFocusStrategy.request(resumeAfterInterruption: true),
      );
    },
    onSelected: (myAudio) async {
      try {
        await audioPlayer.open(
          myAudio,
          autoStart: true,
          showNotification: true,
          playInBackground: PlayInBackground.enabled,
          audioFocusStrategy: const AudioFocusStrategy.request(
              resumeAfterInterruption: true,
              resumeOthersPlayersAfterDone: true),
          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
          notificationSettings: const NotificationSettings(),
        );
      } catch (e) {}
    },
    playing: playing,
  );
}
