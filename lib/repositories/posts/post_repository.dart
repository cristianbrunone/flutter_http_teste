import 'package:flutter_http/model/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> retornaPosts(); 
}
