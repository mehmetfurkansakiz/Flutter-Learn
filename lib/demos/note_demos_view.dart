import 'package:flutter/material.dart';
import 'package:flutter_learn/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({super.key});
  final _title = 'Create your first note';
  final _description = 'Add a note for unique book and apple';
  final _createNote = 'Create a Note';
  final _importNotes = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleBookWithoutPath),
            _BoldTitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget(title: _description * 6),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorLight),
                child: SizedBox(
                    height: ButtonHeights.buttonNormalHeight,
                    child: Center(
                        child: Text(
                      _createNote,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )))),
            TextButton(
                onPressed: () {},
                child: Text(
                  _importNotes,
                )),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

// Centered Text Widget
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget(
      {super.key, this.textAlign = TextAlign.center, required this.title});
  final TextAlign? textAlign;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ));
  }
}

class _BoldTitleWidget extends StatelessWidget {
  const _BoldTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ));
  }
}

class PaddingItems {
  static final EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}
