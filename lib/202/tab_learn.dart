import 'package:flutter/material.dart';
import 'package:flutter_learn/101/icon_learn.dart';
import 'package:flutter_learn/101/image_learn.dart';
import 'package:flutter_learn/101/list_tile_learn.dart';
import 'package:flutter_learn/101/list_view_learn.dart';
import 'package:flutter_learn/101/scaffold_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedMargin = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(_MyTabViews.home.index);
            },
            shape: CircleBorder(),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedMargin,
            child: _MyTabBar(),
          ),
          appBar: AppBar(
              // bottom: const TabBar(tabs: [
              //   Tab(
              //     text: 'TabBar 1',
              //   ),
              //   Tab(
              //     text: 'TabBar 2',
              //   )
              // ]),
              ),
          body: _MyTabBarView(),
        ));
  }

  TabBarView _MyTabBarView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        ImageLearnView(),
        IconLearnView(),
        ListTileLearnView(),
        ListViewLearn(),
        ScaffoldLearnView(),
      ],
    );
  }

  TabBar _MyTabBar() {
    return TabBar(
        // isScrollable: true,
        padding: EdgeInsets.zero, //uygulamaların crash olmasını kırmak için kullanılıyor
        onTap: (int value) {
          print(value);
        },
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: '${e.name}',
                ))
            .toList());
  }
}

enum _MyTabViews {
  home,
  learn,
  settings,
  profile,
  favorites,
}

extension _MyTabViewExtension on _MyTabViews {}
