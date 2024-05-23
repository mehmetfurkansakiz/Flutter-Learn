import 'package:flutter/material.dart';

class CustomWidgetLearnView extends StatelessWidget {
  const CustomWidgetLearnView({super.key});
  final String title = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomButtonWidget(
            title: title,
            onPressed: () {},
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButtonWidget(
                title: title,
                onPressed: () {},
              ),
            ),
          ))
        ],
      ),
    );
  }
}

mixin _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

mixin _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}

class CustomButtonWidget extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomButtonWidget({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: redColor, shape: StadiumBorder()),
      onPressed: () {},
      child: Padding(
        padding: normal2xPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
