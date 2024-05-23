import 'package:flutter/material.dart';
import 'package:flutter_learn/product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 1;

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue += 1;
    } else {
      _countValue -= 1;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _deincrementButton(),
          _incrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            '$_countValue',
            style: Theme.of(context).textTheme.displayLarge,
          )),
          const Placeholder(),
          CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton _deincrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(false);
      },
      child: Icon(Icons.exposure_minus_1_rounded),
    );
  }

  Padding _incrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(true);
        },
        child: Icon(Icons.plus_one_rounded),
      ),
    );
  }
}
