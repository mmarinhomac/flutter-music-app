import 'package:flutter/material.dart';
import 'package:music_app/common/models/music.dart';

class PlayerProvider with ChangeNotifier {
  bool played = false;
  Music music = const Music(
    id: '',
    title: '',
    artist: '',
    image: '',
    preview: '',
    time: '',
  );

  void setTogglePlay() {
    played = !played;
    notifyListeners();
  }

  void setPlayedDefault() {
    played = false;
    notifyListeners();
  }

  void setCurrentMusic(Music data) {
    music = data;
  }
}
