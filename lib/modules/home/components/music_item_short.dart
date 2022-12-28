import 'package:flutter/material.dart';

import 'package:music_app/common/models/album.dart';

class MusicItemShort extends StatelessWidget {
  const MusicItemShort(this.index, this.length, this.album, {super.key});

  final int index;
  final int length;
  final Album album;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        margin: index == 0
            ? const EdgeInsets.fromLTRB(28, 0, 0, 0) // first item
            : (index + 1 == length
                ? const EdgeInsets.fromLTRB(16, 0, 28, 0) // last item
                : const EdgeInsets.fromLTRB(16, 0, 0, 0)), // middle items
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRect(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                height: 140,
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(album.image),
                  ),
                ),
              ),
            ),
            Text(
              album.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              album.artist,
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
