import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({super.key, this.userName});
  final String name = 'Furkan';

  final String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello, $name, your name length is ${name.length}',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: ProjectColor.primaryColor),
          ),
          Text(
            'Nice to meet you!',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ProjectColor.secondaryColor),
          ),
          Text(
            (userName ?? 'username is null'),
          ),
        ],
      )),
    );
  }
}

class ProjectStyle {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      letterSpacing: 2,
      color: Colors.red,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic);
}

class ProjectColor {
  static Color primaryColor = Colors.blue.shade900;
  static Color secondaryColor = Colors.blue.shade400;
}
