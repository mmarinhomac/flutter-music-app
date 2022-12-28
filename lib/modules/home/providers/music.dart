import 'package:flutter/material.dart';

import 'package:music_app/common/models/album.dart';
import 'package:music_app/common/models/music.dart';

class MusicProvider with ChangeNotifier {
  List<Album> favorites = [];

  void setFavorites(List<Album> data) {
    favorites = data;
    notifyListeners();
  }

  List<Music> mostPopular = [];

  void setMostPopular(List<Music> data) {
    mostPopular = data;
    notifyListeners();
  }

  String search = '';

  void setSearch(String value) {
    search = value;
    notifyListeners();
  }
}
