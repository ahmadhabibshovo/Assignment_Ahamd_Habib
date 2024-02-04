import 'package:assets_audio_player/assets_audio_player.dart';

final audios = <Audio>[
  Audio(
    'assets/audios/Mere_Ram.mp3',
    //playSpeed: 2.0,
    metas: Metas(
      id: 'Mere_Ram',
      title: 'Mere_Ram',
      artist: 'Babul Supriyo',
      image: const MetasImage.asset('assets/images/music_library/Mere_Ram.jpg'),
    ),
  ),
  Audio(
    'assets/audios/Raam_Ko_Dekh_Kar_Shri_Janak_Nandni.mp3',
    metas: Metas(
      id: 'Raam_Ko_Dekh_Kar_Shri_Janak_Nandni',
      title: 'Raam_Ko_Dekh_Kar',
      artist: 'Aadarsh Buddy',
      image: const MetasImage.asset(
          'assets/images/music_library/Raam_Ko_Dekh_Kar_Shri_Janak_Nandni.jpg'),
    ),
  ),
  Audio(
    'assets/audios/Ram_Siya_Ram.mp3',
    metas: Metas(
      id: 'Ram_Siya_Ram',
      title: 'Ram_Siya_Ram',
      artist: 'Sachet Tandon',
      image: const MetasImage.asset('assets/images/music_library/Ram_Siya_Ram.jpg'),
    ),
  ),
  Audio(
    'assets/audios/Shre_Ram_Chandra.mp3',
    metas: Metas(
      id: 'Shre_Ram_Chandra',
      title: 'Shre_Ram_Chandra',
      artist: 'Agam Aggarwal',
      image:
          const MetasImage.asset('assets/images/music_library/Shre_Ram_Chandra.jpg'),
    ),
  ),
];
