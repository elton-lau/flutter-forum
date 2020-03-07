import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:providerarch/core/models/comment.dart';
import 'package:providerarch/core/models/post.dart';
import 'package:providerarch/core/models/user.dart';

class MockApi {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = http.Client();

  Future<User> getUserProfile(int userId) async {
    // get profile by id
    var response = await client.get('$endpoint/users/$userId');
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    //get user posts by id
    var response = await client.get('$endpoint/posts?userId=$userId');

    //parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    // get comments for post
    var response = await client.get('$endpoint/comments?=$postId');

    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
