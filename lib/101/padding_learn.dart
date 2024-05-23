import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaddingLearnView extends StatelessWidget {
  const PaddingLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                color: Colors.blue,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                color: Colors.blue,
                height: 100,
              ),
            ),
            Padding(
              padding: ProjectPadding.pagePaddingVertical +
                  ProjectPadding.pagePaddingRightOnly,
              child: Text('Mehmet Furkan'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10);

  static final pagePaddingRightOnly = const EdgeInsets.only(right: 20);
}
