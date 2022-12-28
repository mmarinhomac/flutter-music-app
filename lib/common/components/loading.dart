import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Loading...',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
