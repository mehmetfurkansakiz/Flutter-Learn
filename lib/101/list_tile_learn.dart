import 'package:flutter/material.dart';
import 'package:flutter_learn/core/random_image.dart';

class ListTileLearnView extends StatelessWidget {
  const ListTileLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: RandomImage(),
                  // contentPadding: EdgeInsets.zero, //main içerisinde Theme'da tüm listtile'lar için zero olarak veriyoruz.
                  onTap: () {},
                  subtitle: const Text('How do you use your card'),
                  minVerticalPadding: 0,
                  dense: true,
                  leading: Container(
                      height: 25,
                      width: 25,
                      alignment: Alignment.centerLeft,
                      color: Colors.red,
                      child: const Icon(Icons.wallet)),
                  trailing:
                      const SizedBox(width: 20, child: Icon(Icons.arrow_right)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
