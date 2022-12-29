import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:music_app/services/deezer.dart';

import 'package:music_app/modules/home/business/album.dart';
import 'package:music_app/modules/home/business/music.dart';

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

    void initAlbums(List result) {
      List<Album> data = AlbumBusiness(result).getAlbums();
      musicContext.setAlbums(data);
    }

    void initMostPopular(List result) {
      List<Music> data = MusicBusiness(result).getTracks();
      musicContext.setMostPopular(data);
    }

    void onSearchRequest(String value) async {
      try {
        Map response = await DeezerService().getTracksBySearch(value);
        List<Music> data = [];

        if (response['error'] == null) {
          data = MusicBusiness(response['tracks']).getTracks();
        } else {
          // handle error
        }

        musicContext.setSearchedList(data);
      } catch (error) {
        // handle error
      }
    }

    void onSearchUpdate(String value) {
      try {
        musicContext.timeInstace.cancel();

        Timer time = Timer(
          const Duration(milliseconds: 1450),
          () {
            musicContext.setSearch(value);
          },
        );
        musicContext.setTimeInstance(time);
      } catch (error) {
        // handle error
      }
    }

    void onMusicSelect(Music data) {
      playerContext.setInitialState();
      playerContext.setCurrentMusic(data);
      Navigator.pushNamed(context, '/play');
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // canRequest Search
      if (musicContext.canRequestSearch) {
        musicContext.setCanRequestSearch(false);
        onSearchRequest(musicContext.search);
      }
    });

    return StatefulWrapper(
      onInit: () async {
        Map response = await DeezerService().getInitialData();
        if (response['error'] == null) {
          initMostPopular(response['tracks']);
          initAlbums(response['albums']);
        } else {
          // handle error
        }
      },
      child: HomeDash(
        musicContext.albums,
        musicContext.mostPopular,
        musicContext.searchedList,
        onSearchUpdate,
        onMusicSelect,
      ),
    );
  }
}
