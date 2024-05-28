// ignore_for_file: unused_field, unused_local_variable, unused_element, unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/202/service/comments_learn_view.dart';
import 'package:flutter_learn/202/service/post_model.dart';
import 'package:flutter_learn/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManager;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  late final PostService _postService;

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Learn'),
        actions: [_isLoading ? CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(model: _items?[index]);
        },
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
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //route, yönlendirme, navigation, tıklanınca o item'ın detay sayfasına yönlendirme
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentsLearnView(
              postId: _model?.id,
            ),
          ));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
