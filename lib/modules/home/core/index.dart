import 'package:flutter/material.dart';
import 'package:music_app/modules/home/views/index.dart';
import 'package:provider/provider.dart';

import 'package:music_app/modules/home/providers/music.dart';

class HomeCore extends StatelessWidget {
  const HomeCore({super.key});

  @override
  Widget build(BuildContext context) {
    final MusicProvider musicContext = Provider.of(context);

    void onSearchUpdate(String value) {
      musicContext.setSearch(value);
    }

    return HomeDash(onSearchUpdate);
  }
}
