import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:music_app/services/deezer.dart';

import 'package:music_app/common/utils/stateful_wrapper.dart';

import 'package:music_app/modules/home/providers/music.dart';
import 'package:music_app/modules/player/providers/player.dart';

import 'package:music_app/common/models/album.dart';
import 'package:music_app/common/models/music.dart';

import 'package:music_app/modules/home/views/index.dart';

class HomeCore extends StatelessWidget {
  const HomeCore({super.key});

  @override
  Widget build(BuildContext context) {
    final MusicProvider musicContext = Provider.of(context);
    final PlayerProvider playerContext = Provider.of(context);

    void initFavorites(List result) {
      try {
        List<Album> data = result.map((item) {
          // title
          final int titleLength = item['title'].toString().length;
          final bool titleLong = titleLength >= 12;
          final String title = item['title']
                  .toString()
                  .substring(0, titleLong ? 12 : titleLength) +
              (titleLong ? '...' : '');

          // artist
          final int artistLength = item['artist']['name'].toString().length;
          final bool artistLong = artistLength >= 14;
          final String artist = item['artist']['name']
                  .toString()
                  .substring(0, artistLong ? 14 : artistLength) +
              (artistLong ? '...' : '');

          return Album(
            id: item['id'].toString(),
            title: title,
            artist: artist,
            image: item['cover_medium'],
          );
        }).toList();
        musicContext.setFavorites(data);
      } catch (error) {
        // handle error
      }
    }

    void initMostPopular(List result) {
      try {
        List<Music> data = result.map((item) {
          // title
          final int titleLength = item['title_short'].toString().length;
          final bool titleLong = titleLength >= 22;
          final String title = item['title_short']
                  .toString()
                  .substring(0, titleLong ? 22 : titleLength) +
              (titleLong ? '...' : '');

          // time
          final int timeIndexAux =
              (item['duration'] / 60).toString().indexOf('.');
          final String time = double.parse((item['duration'] / 60).toString())
              .toStringAsFixed(2)
              .toString()
              .substring(0, timeIndexAux + 3)
              .replaceAll('.', ':');

          return Music(
            id: item['id'].toString(),
            title: title,
            artist: item['artist']['name'],
            image: item['album']['cover_medium'],
            time: time,
            preview: item['preview'],
          );
        }).toList();
        musicContext.setMostPopular(data);
      } catch (error) {
        // handle error
      }
    }

    void onSearchUpdate(String value) {
      musicContext.setSearch(value);
    }

    void onMusicSelect(Music data) {
      playerContext.setCurrentMusic(data);
      Navigator.pushNamed(context, '/play');
    }

    return StatefulWrapper(
      onInit: () async {
        Map response = await DeezerService().getInitialData();
        if (response['error'] == null) {
          initMostPopular(response['tracks']);
          initFavorites(response['albums']);
        } else {
          // handle error
        }
      },
      child: HomeDash(
        musicContext.favorites,
        musicContext.mostPopular,
        onSearchUpdate,
        onMusicSelect,
      ),
    );
  }
}
