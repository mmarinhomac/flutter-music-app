import 'package:flutter/material.dart';
import 'package:music_app/modules/home/provider/music.dart';

import 'package:music_app/modules/home/views/index.dart';
import 'package:music_app/modules/player/views/index.dart';
import 'package:provider/provider.dart';

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
          '/': (_) => const HomeDash(),
          '/play': (_) => const Player(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
