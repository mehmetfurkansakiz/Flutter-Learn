import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder Learn'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.green,
          );
        },
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [Expanded(child: Image.network('https://picsum.photos/id/$index/200/300')), Text('$index')],
            ),
          );
        },
        itemCount: 100,
      ),
    );
  }
}
