import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assignment_app/pages/music_library/audios/audios.dart';
import 'package:assignment_app/pages/music_library/widgets/music_controllers/playingController.dart';
import 'package:assignment_app/pages/music_library/widgets/music_controllers/playtime_controller.dart';
import 'package:assignment_app/pages/music_library/widgets/music_player.dart';
import 'package:assignment_app/pages/music_library/widgets/song_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/themes/theme.dart';

class MusicLibrary extends StatefulWidget {
  const MusicLibrary({
    super.key,
  });

  @override
  _MusicLibraryState createState() => _MusicLibraryState();
}

class _MusicLibraryState extends State<MusicLibrary> {
  //final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  late AssetsAudioPlayer _assetsAudioPlayer;
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    _subscriptions
        .add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {}));
    _subscriptions
        .add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {}));
    openPlayer();
  }

  void openPlayer() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Library"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Get.changeTheme(
                    Get.isDarkMode ? lightTheme : darkTheme,
                  );
                });
              },
              icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.sunny))
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 48.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                MusicPlayer(_assetsAudioPlayer),
                const SizedBox(height: 40),
                const SizedBox(height: 20),
                _assetsAudioPlayer.builderCurrent(
                    builder: (bContext, Playing? playing) {
                  return Column(
                    children: <Widget>[
                      _assetsAudioPlayer.builderLoopMode(
                        builder: (context, loopMode) {
                          return PlayerBuilder.isPlaying(
                              player: _assetsAudioPlayer,
                              builder: (context, isPlaying) {
                                return playingContrller(
                                    loopMode, isPlaying, _assetsAudioPlayer);
                              });
                        },
                      ),
                      _assetsAudioPlayer.builderRealtimePlayingInfos(builder:
                          (BuildContext bContext, RealtimePlayingInfos? infos) {
                        if (infos == null) {
                          return const SizedBox();
                        }
                        //print('infos: $infos');
                        return playtime_Controller(infos, _assetsAudioPlayer);
                      }),
                    ],
                  );
                }),
                _assetsAudioPlayer.builderCurrent(
                    builder: (BuildContext bContext, Playing? playing) {
                  return songsSelector(_assetsAudioPlayer, playing);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
