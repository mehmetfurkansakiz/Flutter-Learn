import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(width: 200, height: 200, child: Text('a' * 500)),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 100,
            child: Text('a' * 500),
          ),
          Container(
            width: 50,
            constraints: const BoxConstraints(
              minHeight: 100,
              maxHeight: 400,
            ),
            child: Text('b' * 1000),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectContainerDecoration(),
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      // color: Colors.red,
      borderRadius: BorderRadius.circular(25),
      gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
      boxShadow: const [
        BoxShadow(
          color: Colors.green,
          offset: Offset(0.1, 1),
          blurRadius: 10,
        )
      ],
      // shape: BoxShape.circle,
      border: Border.all(
        width: 1,
        color: Colors.blue,
      ));
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(

            // color: Colors.red,
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 162, 159, 159), Colors.blue]),
            boxShadow: const [
              BoxShadow(
                color: Colors.green,
                offset: Offset(0.1, 1),
                blurRadius: 10,
              )
            ],
            // shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: Colors.blue,
            ));
}
