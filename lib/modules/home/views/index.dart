import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_app/modules/home/components/blur.dart';

class HomeDash extends StatelessWidget {
  const HomeDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)),
      body: Column(
        children: [
          Stack(
            children: const [
              BlurCircle(Color.fromRGBO(59, 8, 202, 35), 0.0, -150.0, 0.0),
              BlurCircle(Color.fromRGBO(214, 114, 216, 25), 300.0, -200.0, 0.0),
            ],
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -275.0, 0.0),
            child: const Text(
              'Good Evening ✨',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
    );
  }
}
