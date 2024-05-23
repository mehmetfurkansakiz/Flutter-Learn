import 'package:flutter/material.dart';

class StatelessLearnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Learn View'),
      ),
      body: Column(
        children: [
          const TitleTextWidget(text: 'Furkan1'),
          _emptyBox(),
          const TitleTextWidget(text: 'Furkan2'),
          _emptyBox(),
          const TitleTextWidget(text: 'Furkan3'),
          _emptyBox(),
          const TitleTextWidget(text: 'Furkan4'),
          _emptyBox(),
          const _CustomContainer(),
          _emptyBox(),
        ],
      ),
    );
  }

  SizedBox _emptyBox() {
    return const SizedBox(
      height: 34,
    );
  }
}

class _CustomContainer extends StatelessWidget {
  // _ işareti sadece bu dosya içerisinde erişilebilir olduğunu belli ediyor yani #private
  const _CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
      child: Text('a' * 300),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
