import 'dart:convert';

import 'package:flutter_http/model/post_model.dart';
import 'package:flutter_http/repositories/jsonplaceholder_custom_dio.dart';
import 'package:flutter_http/repositories/posts/post_repository.dart';

class PostHttpRepository implements PostsRepository {
  @override
  Future<List<PostModel>> retornaPosts() async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response = await jsonPlaceHolderCustomDio.dio
        .get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
