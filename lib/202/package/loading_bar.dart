import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key, this.size});
  final double? size;
  final double _defaultSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(
      color: Colors.green,
      size: size ?? _defaultSize,
      // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
    );
  }
}
