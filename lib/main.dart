import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:music_app/modules/home/providers/music.dart';

import 'package:music_app/modules/home/core/index.dart';
import 'package:music_app/modules/player/views/index.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MusicProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        routes: {
          '/': (_) => const HomeCore(),
          '/play': (_) => const Player(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
