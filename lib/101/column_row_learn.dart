import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // 4+2+2+2
          Expanded(
              flex: 4, //%40
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ],
              )),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize
                  .min, //default olarak max tanımlanır. min değerinde yer kaplar ortaya gelir componentler
              children: [
                Container(color: Colors.red, child: const Text('a')),
                const Text('a1'),
                const Text('a2'),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child:
                  Container(color: Colors.amber, child: const FlutterLogo())),
          const SizedBox(
            height: ProjectContainerSized.cardHeight,
            child: Column(
              children: [
                Expanded(
                  child: Text('Data'),
                ),
                Expanded(
                  child: Text('Data'),
                ),
                Expanded(
                  child: Text('Data'),
                ),
                Spacer(),
                Expanded(
                  child: Text('Data'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProjectContainerSized {
  static const double cardHeight = 200;
}
