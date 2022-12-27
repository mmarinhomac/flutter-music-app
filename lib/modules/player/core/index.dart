import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:music_app/modules/player/providers/player.dart';

import 'package:music_app/modules/player/views/index.dart';

class PlayerCore extends StatelessWidget {
  const PlayerCore({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerContext = Provider.of(context);

    void onTogglePlay() {
      playerContext.setTogglePlay();
    }

    void onGoBack() {
      Navigator.pushNamed(context, '/');
    }

    return Player(playerContext.music, onTogglePlay, onGoBack);
  }
}
