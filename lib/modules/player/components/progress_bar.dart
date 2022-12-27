import 'package:flutter/material.dart';

import 'package:music_app/common/models/music.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(this.music, {super.key});

  final Music music;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: const Color.fromRGBO(255, 255, 255, 0.3),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(224, 90, 247, 1),
                          Color.fromRGBO(95, 22, 188, 1),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '2:43',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                music.time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
