import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http/screens/comments_page.dart';
import 'package:flutter_http/screens/consulta_cep.dart';
import 'package:flutter_http/screens/posts_page.dart';

const String ROUTE_TESTE = '/teste';
const String ROUTE_POST = '/post';
const String ROUTE_COMMENT = '/comment';

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_TESTE:
        return _buildPageRoute(ConsultaCepPage(), settings);
      case ROUTE_POST:
        return _buildPageRoute(PostsPage(), settings);
      case ROUTE_COMMENT:
        final int postId = settings.arguments as int; //obtener el post id aqui
        return _buildPageRoute(
            CommentsPage(
              postId: postId,
            ),
            settings);
      default:
        return _buildPageRoute(PostsPage(), settings);
    }
  }

  static Route<dynamic> _buildPageRoute(Widget page, RouteSettings settings) {
    final bool fromLeft =
        (settings.arguments is bool) ? settings.arguments as bool : false;

    if (fromLeft) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0); // Transition from left
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
    } else {
      if (Platform.isAndroid) {
        return MaterialPageRoute(builder: (_) => page);
      } else if (Platform.isIOS) {
        return CupertinoPageRoute(builder: (_) => page);
      } else {
        return MaterialPageRoute(builder: (_) => page);
      }
    }
  }
}
