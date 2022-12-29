import 'package:flutter/material.dart';

import 'package:music_app/common/utils/stateful_wrapper.dart';

class InputTime extends StatelessWidget {
  const InputTime(this.icon, this.placeholder, this.onAction, {super.key});

  final Icon icon;
  final String placeholder;
  final void Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Color.fromRGBO(32, 32, 32, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: icon,
            color: const Color.fromRGBO(190, 190, 190, 1),
            onPressed: () {},
          ),
          Expanded(
            child: StatefulWrapper(
              onInit: () {},
              child: TextFormField(
                onChanged: (value) => onAction(value),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(190, 190, 190, 1),
                  ),
                ),
                style: const TextStyle(
                  color: Color.fromRGBO(190, 190, 190, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
