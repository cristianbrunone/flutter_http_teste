import 'package:flutter/material.dart';
import 'package:flutter_http/model/post_model.dart';
import 'package:flutter_http/repositories/post_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final postsRepository = PostRepository();
  var posts = <PostModel>[];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    posts = await postsRepository.getPosts();
    setState(() {}); // Atualiza a interface do usuário
    print(posts);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, index) {
            var post = posts[index];
            return Card(
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          post.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          post.body,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}