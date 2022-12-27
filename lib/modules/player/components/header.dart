import 'package:flutter/material.dart';

class HeaderPlayer extends StatelessWidget {
  const HeaderPlayer(this.onGoBack, {super.key});

  final void Function() onGoBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(28, 54, 28, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => onGoBack(),
            icon: const Icon(Icons.chevron_left),
            color: Colors.white,
            iconSize: 34,
          ),
          const Text(
            'Go Back',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.chevron_left),
            color: Colors.black,
            iconSize: 34,
          ),
        ],
      ),
    );
  }
}
