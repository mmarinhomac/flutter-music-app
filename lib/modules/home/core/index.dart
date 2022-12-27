import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:music_app/services/deezer.dart';

import 'package:music_app/common/utils/stateful_wrapper.dart';

import 'package:music_app/modules/home/providers/music.dart';
import 'package:music_app/modules/player/providers/player.dart';

import 'package:music_app/common/models/music.dart';

import 'package:music_app/modules/home/views/index.dart';

class HomeCore extends StatelessWidget {
  const HomeCore({super.key});

  @override
  Widget build(BuildContext context) {
    final MusicProvider musicContext = Provider.of(context);
    final PlayerProvider playerContext = Provider.of(context);

    void onSearchUpdate(String value) {
      musicContext.setSearch(value);
    }

    void onMusicSelect(Music data) {
      playerContext.setCurrentMusic(data);
      Navigator.pushNamed(context, '/play');
    }

    return StatefulWrapper(
      onInit: () {
        DeezerService().getPosts();
      },
      child: HomeDash(onSearchUpdate, onMusicSelect),
    );
  }
}
