import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:providerarch/core/models/post.dart';
import 'package:providerarch/ui/shared/shared_style.dart';
import 'package:providerarch/ui/widgets/comments.dart';
import 'package:providerarch/viewmodels/post_view_model.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PostViewModel>.withConsumer(
      viewModel: PostViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UIHelper.verticalSpaceLarge(),
              Text(post.title, style: headerStyle),
              Text(
                'by ${model.currentUser.name}',
                style: TextStyle(fontSize: 9.0),
              ),
              UIHelper.verticalSpaceMedium(),
              Text(post.body),
              Comments(post.id)
            ],
          ),
        ),
      ),
    );
  }
}
