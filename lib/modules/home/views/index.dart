import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:music_app/modules/home/components/blur.dart';
import 'package:music_app/modules/home/provider/music.dart';

class HomeDash extends StatelessWidget {
  const HomeDash({super.key});

  @override
  Widget build(BuildContext context) {
    final MusicProvider musicContext = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: const [
              BlurCircle(Color.fromRGBO(59, 8, 202, 35), 0.0, -150.0, 0.0),
              BlurCircle(Color.fromRGBO(214, 114, 216, 25), 300.0, -200.0, 0.0),
            ],
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(28.0, 0.0, 28.0, 0.0),
              transform: Matrix4.translationValues(0.0, -275.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Good Evening ✨',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'what do you want do listen today?',
                    style: TextStyle(
                      color: Color.fromRGBO(167, 167, 167, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  )
                ],
              ))
        ],
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
    );
  }
}
