import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.blueAccent,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              color: Colors.red,
              height: 100,
            ),
          ),
          Positioned(
              height: 50,
              top: 40,
              right: 50,
              left: 50,
              child: Container(
                color: Colors.amber,
              )),
          Positioned.fill(
              top: 50,
              left: 100,
              right: 100,
              child: Container(
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
