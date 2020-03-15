import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:providerarch/core/models/comment.dart';
import 'package:providerarch/ui/shared/shared_style.dart';
import 'package:providerarch/viewmodels/comments_view_model.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CommentsViewModel>.withConsumer(
      viewModel: CommentsViewModel(),
      onModelReady: (model) => model.fetchComments(postId),
      builder: (context, model, child) => model.busy
          ? Center(child: CircularProgressIndicator())
          : Expanded(
              child: ListView(
                children: model.comments
                    .map((comment) => CommentItem(comment))
                    .toList(),
              ),
            ),
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}
