import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_app/common/models/music.dart';

import 'package:music_app/common/components/loading.dart';
import 'package:music_app/modules/player/components/command_player.dart';
import 'package:music_app/modules/player/components/header.dart';
import 'package:music_app/modules/player/components/music_view.dart';
import 'package:music_app/modules/player/components/progress_bar.dart';

class Player extends StatelessWidget {
  const Player(this.music, this.played, this.onTogglePlay, this.onGoBack,
      this.volume, this.setVolume,
      {super.key});

  final Music music;
  final bool played;
  final void Function() onTogglePlay;
  final void Function() onGoBack;
  final double volume;
  final void Function(double volume) setVolume;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      body: music.id.isNotEmpty
          ? Column(
              children: [
                HeaderPlayer(onGoBack),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 34,
                      ),
                      MusicView(music, volume, setVolume),
                      const SizedBox(),
                      ProgressBar(music),
                      CommandPlayer(played, onTogglePlay),
                      const SizedBox(
                        height: 54,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Loading(),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
    );
  }
}
