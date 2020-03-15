import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:providerarch/ui/shared/shared_style.dart';
import 'package:providerarch/ui/widgets/posts.dart';
import 'package:providerarch/viewmodels/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.getPosts(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: !model.busy
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.horizontalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${model.currentUser.userName}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Here are all your posts',
                      style: subHeaderStyle,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Posts(posts: model.posts),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
