import 'package:dio/dio.dart';
import 'package:flutter_http/model/comment_model.dart';
import 'package:flutter_http/repositories/comments/comments_repository.dart';
import 'package:flutter_http/repositories/jsonplaceholder_custom_dio.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHoldeCustomDio = JsonPlaceHolderCustomDio();
    var response =
        await jsonPlaceHoldeCustomDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
