import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:providerarch/core/models/post.dart';

class Posts extends StatelessWidget {
  final List<Post> posts;
  Posts({@required this.posts});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, 'post', arguments: posts[index]);
          },
        ),
      ),
    );
  }
}

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  PostListItem({@required this.post, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                offset: Offset(0, 2),
                color: Color.fromARGB(80, 0, 0, 0),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
            ),
            Text(
              post.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
