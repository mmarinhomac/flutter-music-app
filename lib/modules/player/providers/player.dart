import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:music_app/common/models/music.dart';

class PlayerProvider with ChangeNotifier {
  bool played = true;
  String source = '';
  final player = AudioPlayer();

  void setTogglePlay() {
    played = !played;
    notifyListeners();
  }

  Future<void> setSource(String url) async {
    source = url;
    await player.setUrl(music.preview);
  }

  Music music = const Music(
    id: '',
    title: '',
    artist: '',
    image: '',
    preview: '',
    time: '',
  );

  void setCurrentMusic(Music data) {
    music = data;
  }

  void setInitialState() {
    played = true;
    source = '';
    music = const Music(
      id: '',
      title: '',
      artist: '',
      image: '',
      preview: '',
      time: '',
    );
  }
}
