import 'package:flutter/material.dart';

import 'package:music_app/common/models/music.dart';

class MusicView extends StatelessWidget {
  const MusicView(this.music, this.volume, this.setVolume, {super.key});

  final Music music;
  final double volume;
  final void Function(double volume) setVolume;

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
                    RotatedBox(
                      quarterTurns: -1,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0,
                          ),
                        ),
                        child: Slider(
                          min: 0.0,
                          max: 1,
                          value: volume,
                          activeColor: Colors.white,
                          inactiveColor:
                              const Color.fromRGBO(255, 255, 255, 0.40),
                          onChanged: (value) {
                            setVolume(value);
                          },
                        ),
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
          Column(
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
        ],
      ),
    );
  }
}
