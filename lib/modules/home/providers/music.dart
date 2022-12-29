import 'package:flutter/material.dart';
import 'dart:async';

import 'package:music_app/common/models/album.dart';
import 'package:music_app/common/models/music.dart';

class MusicProvider with ChangeNotifier {
  List<Album> albums = [];

  void setAlbums(List<Album> data) {
    albums = data;
    notifyListeners();
  }

  List<Music> mostPopular = [];

  void setMostPopular(List<Music> data) {
    mostPopular = data;
    notifyListeners();
  }

  List<Music> searchedList = [];

  void setSearchedList(List<Music> data) {
    searchedList = data;
    notifyListeners();
  }

  String search = '';
  bool canRequestSearch = false;
  Timer timeInstace = Timer(const Duration(seconds: 0), () {});

  void setSearch(String value) {
    canRequestSearch = true;
    search = value;
    notifyListeners();
  }

  void setCanRequestSearch(bool option) {
    canRequestSearch = option;
    notifyListeners();
  }

  void setTimeInstance(Timer time) {
    timeInstace = time;
  }
}
