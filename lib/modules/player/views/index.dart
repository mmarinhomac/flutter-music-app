import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_app/common/models/music.dart';

import 'package:music_app/modules/player/components/command_player.dart';
import 'package:music_app/modules/player/components/header.dart';
import 'package:music_app/modules/player/components/music_view.dart';
import 'package:music_app/modules/player/components/progress_bar.dart';

class Player extends StatelessWidget {
  const Player(this.music, this.onTogglePlay, this.onGoBack, {super.key});

  final Music music;
  final void Function() onTogglePlay;
  final void Function() onGoBack;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          HeaderPlayer(onGoBack),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 54,
                ),
                MusicView(music),
                ProgressBar(music),
                const CommandPlayer(),
                const SizedBox(
                  height: 54,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
    );
  }
}
