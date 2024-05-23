import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  var name = 'Mehmet Furkan';
  bool _isLoading = false;
  late final Dio _networkManager;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _networkManager.post('posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = 'Basarili';
    } else {
      name = 'Basarisiz';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? 'Service Post Learn View'),
        actions: [_isLoading ? CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _bodyController,
            decoration: InputDecoration(labelText: 'Body'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.creditCardNumber],
            decoration: InputDecoration(labelText: 'UserId'),
            textInputAction: TextInputAction.done,
          ),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));
                        _addItemToService(model);
                      }
                    },
              child: Text('Send')),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  // Constructor'da model parametresi zorunlu olarak alınır ve _model değişkenine atanır.
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  // _model adında bir final değişkeni tanımlanır, bu değişken PostModel türündedir ve nullable'dır.
  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
