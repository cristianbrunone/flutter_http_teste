import 'dart:convert';

import 'package:flutter_http/model/comment_model.dart';
import 'package:flutter_http/repositories/comments/comments_repository.dart';
import 'package:http/http.dart' as http;

class CommentsHttpRepository  implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postID) async {
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postID/comments"));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
