import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lessons43/features/posts/data/models/posts_models.dart';
import 'package:lessons43/features/posts/domain/repositories/posts_repositori.dart';
import 'package:lessons43/internal/helpers/api_requester.dart';
import 'package:lessons43/internal/helpers/catch_exception.dart';

class PostsRepositoryImpl implements PostsRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      Response response = await apiRequester.toGet('posts');
      log('getAllPosts response statusCode == ${response.statusCode}');
      log('getAllPosts response data == ${response.data}');

      if (response.statusCode == 200) {
        return response.data
            .map<PostModel>((value) => PostModel.fromJson(value))
            .toList();
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<PostModel> getPostDetail({required int id}) async {
    try {
      Response response = await apiRequester.toGet('posts/$id');
      log('getPostDetail response statusCode == ${response.statusCode}');
      log('getPostDetail response statusCode == ${response.statusCode}');

      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
