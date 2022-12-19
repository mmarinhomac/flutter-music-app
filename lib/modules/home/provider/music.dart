import 'package:flutter/material.dart';

import 'package:music_app/common/data/mock_music.dart';
import 'package:music_app/common/models/music.dart';

class MusicProvider with ChangeNotifier {
  final List<Music> items = [...mockMusic];

  List<Music> get favorites {
    return [...items];
  }

  List<Music> get mostPopular {
    return [...items];
  }
}
