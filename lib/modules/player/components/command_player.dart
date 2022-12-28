import 'package:flutter/material.dart';

class CommandPlayer extends StatelessWidget {
  const CommandPlayer(this.played, this.onPlay, {super.key});

  final bool played;
  final void Function() onPlay;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.rotate(
            angle: 45,
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.play_arrow_outlined),
              color: Colors.white,
              iconSize: 48,
            ),
          ),
          IconButton(
            onPressed: () => onPlay(),
            icon: Icon(played
                ? Icons.pause_circle_rounded
                : Icons.play_circle_rounded),
            color: Colors.white,
            iconSize: 88,
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.play_arrow_outlined),
            color: Colors.white,
            iconSize: 48,
          ),
        ],
      ),
    );
  }
}
