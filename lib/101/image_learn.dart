import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  const ImageLearnView({super.key});
  final String _imagePath =
      'https://encrypted-tb.gstatic.com/images?q=tbn:ANd9GcTHsLRMJHAlLFQxsGaHCbEDT2JwJj7B2vYhbw&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
          height: 400,
          width: 300,
          child: PngImage(name: ImageItems().appleBookWithoutPath),
        ),
        Image.network(
          _imagePath,
          errorBuilder: (context, error, stackTrace) =>
              PngImage(name: ImageItems().appleBookWithoutPath),
        ),
      ]),
    );
  }
}

class ImageItems {
  final String appleWithBook = "assets/apple-book-school.png";
  final String appleAndBook =
      "assets/svg/File_Books_with_Apple_Flat_Icon_Vector.svg";
  final String appleBookWithoutPath = "apple-and-book";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.cover);
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
