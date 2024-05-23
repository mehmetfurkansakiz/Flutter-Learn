import 'package:flutter/material.dart';

class CardLearnView extends StatelessWidget {
  const CardLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _CustomCard(
            child: const SizedBox(
              height: 100,
              width: 500,
              child: Center(child: Text('Mehmet Furkan')),
            ),
          ),
          _CustomCard(
            child: const SizedBox(
              height: 100,
              width: 500,
              child: Center(child: Text('Mehmet Furkan')),
            ),
          ),
          _CustomCard(
            child: const SizedBox(
              height: 100,
              width: 500,
              child: Center(child: Text('Mehmet Furkan')),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMarginAll = EdgeInsets.all(10);
}

class _CustomCard extends StatelessWidget {
  _CustomCard({super.key, required this.child});

  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMarginAll,
      // color: Theme.of(context).colorScheme.onBackground,
      shape: roundedRectangleBorder,
      child: child, //StadiumBorder, CircleBorder
    );
  }
}
