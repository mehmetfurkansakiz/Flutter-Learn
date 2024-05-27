import 'dart:io';

import 'package:flutter_learn/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

//soyut sınıf
abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem); //ana katman

  Future<void> toShare(Uri path) async {
    if (!await launchUrl(path)) throw 'Could not launch $path';
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('no Exception');

    return true;
  }

  void smsShare() {}
}

class SMSDownload implements IFileDownload /* with ShareMixin can not because implements */ {
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('no Exception');

    return true;
  }

  @override
  Future<void> toShare(Uri path) {
    // TODO: implement toShare
    throw UnimplementedError();
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

class FileDownload2 extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
  }
}

mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}
