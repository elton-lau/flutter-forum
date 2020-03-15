import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:providerarch/core/models/post.dart';
import 'package:providerarch/ui/views/home_view.dart';
import 'package:providerarch/ui/views/login_view.dart';
import 'package:providerarch/ui/views/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'post':
        var post = settings.arguments as Post;
        print('Enter post with $post');
        return MaterialPageRoute(
            builder: (_) => PostView(
                  post: post,
                ));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
