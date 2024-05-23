import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learn/202/service/comment_model.dart';
import 'package:flutter_learn/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _networkManager;
  PostService() : _networkManager = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _networkManager.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioException catch (exception) {
      _ShowError.showDioError(exception, this);
      return false;
    }
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _networkManager.put('${_PostServicePaths.posts.name}/$id', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (exception) {
      _ShowError.showDioError(exception, this);
      return false;
    }
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _networkManager.delete('${_PostServicePaths.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (exception) {
      _ShowError.showDioError(exception, this);
      return false;
    }
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _networkManager.get(_PostServicePaths.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowError.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await _networkManager
          .get(_PostServicePaths.comments.name, queryParameters: {_PostQueryPaths.postId.name: postId});
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowError.showDioError(exception, this);
    }
    return null;
  }
}

enum _PostServicePaths {
  posts,
  comments,
}

enum _PostQueryPaths {
  postId,
}

class _ShowError {
  static void showDioError<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}
