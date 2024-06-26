import 'package:flutter/material.dart';
import 'package:flutter_learn/demos/color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Life Cycle'),
        actions: [IconButton(onPressed: _changeBackground, icon: Icon(Icons.clear))],
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(child: ColorDemos(initialColor: _backgroundColor)),
        ],
      ),
    );
  }

  void _changeBackground() {
    setState(() {
      _backgroundColor = Colors.pink;
    });
  }
}
