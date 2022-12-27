import 'package:flutter/material.dart';

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const StatefulWrapper({required this.onInit, required this.child, super.key});

  @override
  State<StatefulWrapper> createState() => _StatefulWrapperState();
}
