import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  ColorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Learn View'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Text(
          'orange',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Theme.of(context).cardColor),
        ),
      ),
    );
  }
}

class ColorsItems {
  static const Color porchase = Color(0xffEDBF61);

  static const Color sulu = Color.fromRGBO(198, 237, 97, 1);
}
