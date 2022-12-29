import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

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

    void onPause() {
      print('onPause');
      playerContext.player.pause();
    }

    void onPlay() async {
      print('onPlay');
      await PerfectVolumeControl.setVolume(0.75);
      if (playerContext.source != playerContext.music.preview) {
        await playerContext.setSource(playerContext.music.preview);
      }
      playerContext.player.play();
    }

    void onGoBack() {
      onPause();
      playerContext.setInitialState();
      Navigator.pushNamed(context, '/');
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // onPlay onPause
      if (playerContext.played) {
        onPlay();
      } else {
        onPause();
      }
    });

    return Player(
      playerContext.music,
      playerContext.played,
      onTogglePlay,
      onGoBack,
    );
  }
}
