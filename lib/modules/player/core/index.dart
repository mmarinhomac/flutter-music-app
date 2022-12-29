import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:volume_controller/volume_controller.dart';

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

    Future<void> onPause() async {
      playerContext.setCanUpdatePlayFalse();
      await playerContext.player.pause();
    }

    Future<void> onPlay() async {
      playerContext.setCanUpdatePlayFalse();
      if (playerContext.source != playerContext.music.preview) {
        await playerContext.setSource(playerContext.music.preview);
      }
      playerContext.player.play();
    }

    void onGoBack() async {
      onPause();
      Navigator.pushNamed(context, '/');
    }

    void setVolume(double volumeUpdated) {
      playerContext.setVolume(volumeUpdated);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // onLoad exec once
      if (playerContext.onLoad) {
        playerContext.setOnLoadFalse();
        onTogglePlay();
        // ...
        playerContext.player.playerStateStream.listen((event) {
          if (event.processingState == ProcessingState.completed) {
            playerContext.onSongStop();
          }
        });
      }

      // onPlay onPause
      if (playerContext.canUpdatePlay) {
        if (playerContext.played) {
          onPlay();
        } else {
          onPause();
        }
      }

      // Volume Control
      final double currentVolume = await VolumeController().getVolume();
      if (currentVolume != playerContext.volume) {
        VolumeController().setVolume(playerContext.volume, showSystemUI: false);
      }
    });

    return Player(
      playerContext.music,
      playerContext.played,
      onTogglePlay,
      onGoBack,
      playerContext.volume,
      setVolume,
    );
  }
}
