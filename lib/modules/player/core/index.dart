import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';

import 'package:music_app/modules/player/providers/player.dart';

import 'package:music_app/modules/player/views/index.dart';

class PlayerCore extends StatelessWidget {
  const PlayerCore({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerContext = Provider.of(context);
    final player = AudioPlayer();

    void onTogglePlay() async {
      try {
        await player.setUrl(playerContext.music.preview);
        await player.play();

        playerContext.setTogglePlay();
      } catch (error) {
        // handle error
        print(error);
      }
    }

    void onGoBack() {
      playerContext.setPlayedDefault();
      Navigator.pushNamed(context, '/');
    }

    return Player(
      playerContext.music,
      playerContext.played,
      onTogglePlay,
      onGoBack,
    );
  }
}
