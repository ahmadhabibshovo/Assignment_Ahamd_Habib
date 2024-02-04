import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class SongsSelector extends StatelessWidget {
  final Playing? playing;
  final List<Audio> audios;
  final Function(Audio) onSelected;
  final Function(List<Audio>) onPlaylistSelected;

  const SongsSelector(
      {super.key, required this.playing,
      required this.audios,
      required this.onSelected,
      required this.onPlaylistSelected});

  Widget _image(Audio item) {
    if (item.metas.image == null) {
      return const SizedBox(height: 40, width: 40);
    }

    return item.metas.image?.type == ImageType.network
        ? Image.network(
            item.metas.image!.path,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          )
        : Image.asset(
            item.metas.image!.path,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
              onPressed: () {
                onPlaylistSelected(audios);
              },
              child: const Center(child: Text('Play All as playlist')),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, position) {
                final item = audios[position];
                final isPlaying = item.path == playing?.audio.assetAudioPath;
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(9)),
                  margin: const EdgeInsets.all(4),
                  child: ListTile(
                      leading: Material(
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: _image(item),
                      ),
                      title: Text(
                        item.metas.title.toString(),
                        style: TextStyle(
                          color: isPlaying
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                      ),
                      subtitle: Text(
                        item.metas.artist.toString(),
                        style: TextStyle(
                          color: isPlaying
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                      ),
                      onTap: () {
                        onSelected(item);
                      }),
                );
              },
              itemCount: audios.length,
            ),
          ),
        ],
      ),
    );
  }
}
