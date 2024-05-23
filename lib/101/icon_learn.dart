import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});

  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons
                    .message_outlined, //outlined müşterilere daha güzel görünür
                color: iconColors.froly,
                size: iconSizes.smallSize,
              )),
          const SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons
                    .message_outlined, //outlined müşterilere daha güzel görünür
                color: iconColors.froly,
                size: iconSizes.smallSize,
              )),
        ],
      ),
    );
  }
}

class IconSizes {
  final double smallSize = 40;
  static const double doubleSmallSize = 80;
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
