import 'package:flutter/material.dart';

import 'package:music_app/modules/home/views/index.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomeDash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
