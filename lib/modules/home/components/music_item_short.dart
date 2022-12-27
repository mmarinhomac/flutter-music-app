import 'package:flutter/material.dart';

import 'package:music_app/common/models/music.dart';

class MusicItemShort extends StatelessWidget {
  const MusicItemShort(this.index, this.length, this.music, this.onMusicSelect,
      {super.key});

  final int index;
  final int length;
  final Music music;
  final void Function(Music data) onMusicSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onMusicSelect(music),
      child: Container(
        margin: index == 0
            ? const EdgeInsets.fromLTRB(28, 0, 0, 0) // first item
            : (index + 1 == length
                ? const EdgeInsets.fromLTRB(24, 0, 28, 0) // last item
                : const EdgeInsets.fromLTRB(24, 0, 0, 0)), // middle items
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRect(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                height: 160,
                width: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(music.image),
                  ),
                ),
              ),
            ),
            Text(
              music.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              music.artist,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
