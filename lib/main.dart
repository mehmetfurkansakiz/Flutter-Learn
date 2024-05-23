import 'package:flutter/material.dart';
import 'package:flutter_learn/202/package_learn_view.dart';
import 'package:flutter_learn/202/theme/light_theme.dart';
import 'package:flutter_learn/202/theme_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,
      // theme: ThemeData.dark().copyWith(
      //   tabBarTheme: const TabBarTheme(
      //     labelColor: ColorsItems.porchase,
      //     unselectedLabelColor: Colors.grey,
      //     indicatorColor: ColorsItems.porchase,
      //     indicatorSize: TabBarIndicatorSize.label,
      //   ),
      //   bottomAppBarTheme: BottomAppBarTheme(
      //     color: Theme.of(context).colorScheme.secondary,
      //     shape: CircularNotchedRectangle(),
      //   ),
      //   listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
      //   progressIndicatorTheme: ProgressIndicatorThemeData(color: Theme.of(context).primaryColorLight),
      //   errorColor: ColorsItems.porchase,
      //   inputDecorationTheme: InputDecorationTheme(
      //     filled: true,
      //     fillColor: Colors.deepPurple,
      //     iconColor: Colors.deepPurple[50],
      //     labelStyle: TextStyle(color: Colors.deepPurple[50]),
      //     floatingLabelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(10),
      //       borderSide: BorderSide(color: Colors.deepPurple[50]!),
      //     ),
      //   ),
      //   appBarTheme: AppBarTheme(
      //     centerTitle: true,
      //     backgroundColor: Theme.of(context).colorScheme.secondary,
      //     elevation: 0,
      //     systemOverlayStyle: SystemUiOverlayStyle.dark,
      //   ),
      // ),
      home: ThemeLearnView(),
    );
  }
}
