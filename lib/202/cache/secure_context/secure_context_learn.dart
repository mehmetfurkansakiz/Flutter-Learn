import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({super.key});

  @override
  State<SecureContextLearn> createState() => _SecureContextLearnState();
}

enum _SecureKeys {
  token,
}

class _SecureContextLearnState extends State<SecureContextLearn> {
  // Init:
  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  // Variables:
  // Create storage
  final _storage = const FlutterSecureStorage();
  String _title = '';
  TextEditingController _controller = TextEditingController();

  // Read data from storage:
  Future<void> getSecureItems() async {
    // Read value
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';

    if (_title.isNotEmpty) {
      print('Bu adam daha önce bu app ');
      _controller.text = _title;
    }

    setState(() {});
  }

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await _storage.write(key: _SecureKeys.token.name, value: _title);
            },
            label: const Text('Save')),
        body: TextField(
          controller: _controller,
          onChanged: saveItems,
          minLines: 2,
          maxLines: 4,
        ));
  }
}
