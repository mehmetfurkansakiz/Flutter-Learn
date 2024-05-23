import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void name(params);

  Future<void> launchUrl(Uri url) async {
    await launchUrl(url);
    throw Exception('Could not launch $url');
  }
}
