// bir ekran olacak
// bu ekranda 3 button olacak ve bunlara basınca renk degisimi olacak
// secili olan button selected icon olsun

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  final Color? initialColor;
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    inspect(widget.initialColor);
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      _backgroundColor = widget.initialColor;
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red), label: 'Red'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: 'Blue'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.green), label: 'Green'),
      ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    } else if (value == _MyColors.green.index) {
      changeBackgroundColor(Colors.green);
    }
  }
}

enum _MyColors { red, blue, green }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      color: color,
    );
  }
}
