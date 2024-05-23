import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.red;
            })),
            onPressed: () {},
            child: Text(
              'TextButton',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_a_photo_outlined)),
          FloatingActionButton(
            onPressed: () {
              // service istek at
              // sayfanin rengini düzenle
            },
            child: const Icon(Icons.add),
          ),
          SizedBox(
            width: 300,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {},
                child: const Text('OutlinedButton')),
          ),
          InkWell(
            onTap: () {},
            child: const Text('InkWell'),
          ),
          Container(
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 50, right: 50),
                child: Text(
                  'Place Bid',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              )),
        ],
      ),
    );
  }
}
