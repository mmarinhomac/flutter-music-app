import 'package:flutter/material.dart';

import 'package:music_app/common/models/music.dart';

class MusicView extends StatelessWidget {
  const MusicView(this.music, {super.key});

  final Music music;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 34,
                height: 120,
              ),
              ClipRect(
                child: SizedBox(
                  height: 240,
                  width: 240,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      child: Image.network(music.image),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 34,
                child: Column(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => {},
                      icon: const Icon(Icons.volume_up),
                      color: Colors.white,
                      iconSize: 18,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      width: 4,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: const Color.fromRGBO(255, 255, 255, 0.40),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => {},
                      icon: const Icon(Icons.volume_off),
                      color: Colors.white,
                      iconSize: 18,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Column(
              children: [
                Text(
                  music.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  music.artist,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
