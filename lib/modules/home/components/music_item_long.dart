import 'package:flutter/material.dart';

import 'package:music_app/common/models/music.dart';

class MusicItemLong extends StatelessWidget {
  const MusicItemLong(this.index, this.music, this.onMusicSelect, {super.key});

  final int index;
  final Music music;
  final void Function(Music data) onMusicSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onMusicSelect(music),
      child: Container(
        margin: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRect(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                    height: 54,
                    width: 54,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        child: Image.network(music.image),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: Text(
                    music.time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  iconSize: 24,
                  color: const Color.fromRGBO(190, 190, 190, 1),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
