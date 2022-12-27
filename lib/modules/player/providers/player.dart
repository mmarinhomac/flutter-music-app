import 'package:flutter/material.dart';
import 'package:music_app/common/models/music.dart';

class PlayerProvider with ChangeNotifier {
  bool play = true;
  Music music = const Music(
    id: '1',
    title: 'Overtime',
    artist: 'Chris Brown',
    image: 'https://i.ytimg.com/vi/9bnDkvCs46g/maxresdefault.jpg',
    time: '3:54',
  );

  void setTogglePlay() {
    play = !play;
  }

  void setCurrentMusic(Music data) {
    music = data;
  }
}
