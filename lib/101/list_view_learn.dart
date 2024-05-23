import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Learn'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
            ),
          ),
          Container(color: Colors.red, height: 300),
          Divider(),
          SizedBox(
            height: 300,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(color: Colors.green, width: 300),
              Container(color: Colors.white, width: 300),
              Container(color: Colors.black, width: 300),
              Container(color: Colors.yellow, width: 300),
              Container(color: Colors.teal, width: 300),
            ]),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
            ),
          ),
          Container(color: Colors.red, height: 300),
          Divider(),
          SizedBox(
            height: 300,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(color: Colors.green, width: 300),
              Container(color: Colors.white, width: 300),
              Container(color: Colors.black, width: 300),
              Container(color: Colors.yellow, width: 300),
              Container(color: Colors.teal, width: 300),
            ]),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          _ListDemo(),
        ],
      ),
    );
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo({super.key});

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    print('hello');
  }

  @override
  void dispose() {
    super.dispose();
    print('goodbye');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
