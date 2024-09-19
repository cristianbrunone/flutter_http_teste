import 'package:flutter/material.dart';
import 'package:flutter_http/model/comment_model.dart';
import 'package:flutter_http/repositories/comments/comments_repository.dart';
import 'package:flutter_http/repositories/comments/impl/comments_dio_repository.dart';
import 'package:flutter_http/repositories/comments/impl/comments_http_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late CommentsRepository commentsRepository;
  var comments = <CommentModel>[];

  @override
  void initState() {
    super.initState();
    commentsRepository = CommentsDioRepository();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentsRepository.retornaComentarios(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Comentarios do Post: ${widget.postId}"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: comments.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: comments.length,
                itemBuilder: (_, int index) {
                  var comment = comments[index];
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: Text(
                              comment.name.substring(0, 6),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: Text(
                              comment.email,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(comment.body),
                          )),
                        ),
                      ],
                    ),
                  );
                }),
      ),
    ));
  }
}
