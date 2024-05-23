import 'package:flutter/material.dart';
import 'package:flutter_learn/101/icon_learn.dart';
import 'package:flutter_learn/101/image_learn.dart';
import 'package:flutter_learn/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 0;

  void _CurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(_currentPageIndex.toString()),
          ),
          Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(duration: _DurationUtility.lowDuration, curve: Curves.slowMiddle);
            },
            child: Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(duration: _DurationUtility.lowDuration, curve: Curves.slowMiddle);
            },
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        onPageChanged: _CurrentPageIndex,
        controller: _pageController,
        children: [
          IconLearnView(),
          const ImageLearnView(),
          const StackLearn(),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const lowDuration = Duration(seconds: 1);
}
