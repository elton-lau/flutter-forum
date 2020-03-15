import 'package:providerarch/core/models/comment.dart';
import 'package:providerarch/core/services/mock_api.dart';
import 'package:providerarch/locator.dart';

import 'base_model.dart';

class CommentsViewModel extends BaseModel {
  MockApi _api = locator<MockApi>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    print('fetching comments for $postId');
    setBusy(true);
    comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }
}
