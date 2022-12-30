import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:music_app/common/models/music.dart';

class PlayerProvider with ChangeNotifier {
  bool onLoad = true;

  void setOnLoadFalse() {
    onLoad = false;
  }

  bool canUpdatePlay = false;
  bool played = false;
  String source = '';
  final player = AudioPlayer();

  void setTogglePlay() {
    canUpdatePlay = true;
    played = !played;
    notifyListeners();
  }

  void setCanUpdatePlayFalse() {
    canUpdatePlay = false;
    notifyListeners();
  }

  void onSongStop() {
    canUpdatePlay = false;
    played = false;
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

  double volume = 0.45;

  void setVolume(double volumeUpdated) {
    volume = volumeUpdated;
    notifyListeners();
  }

  String currentTime = '0:00';

  void setCurrentTime(String time) {
    currentTime = time;
    notifyListeners();
  }

  double progressBarPosition = 0.0;

  void setProgressBarPosition(double position) {
    progressBarPosition = position;
    notifyListeners();
  }

  void setInitialState() {
    onLoad = true;
    canUpdatePlay = false;
    played = false;
    source = '';
    music = const Music(
      id: '',
      title: '',
      artist: '',
      image: '',
      preview: '',
      time: '',
    );
    volume = 0.45;
  }
}
