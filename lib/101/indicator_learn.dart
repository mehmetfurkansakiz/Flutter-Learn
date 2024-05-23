import 'package:flutter/material.dart';

class IndicatorLearnView extends StatelessWidget {
  const IndicatorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [CenterCircularProgress()],
        title: Text('Indicator Learn'),
      ),
      body: LinearProgressIndicator(
        value: 0.5,
      ),
    );
  }
}

class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      strokeWidth: 10,
      value: 0.9,
    ));
  }
}
