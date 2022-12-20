import 'package:flutter/material.dart';

import 'package:music_app/common/models/music.dart';

class MusicItemShort extends StatelessWidget {
  const MusicItemShort(this.index, this.music, {super.key});

  final int index;
  final Music music;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == 0 ? null : const EdgeInsets.fromLTRB(6, 0, 0, 0),
      child: Column(
        children: [
          ClipRect(
            child: Container(
              height: 160,
              width: 160,
              padding: const EdgeInsets.all(12.0),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(music.image),
              ),
            ),
          ),
          Text(
            music.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            music.artist,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
