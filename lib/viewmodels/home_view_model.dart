import 'package:providerarch/core/models/post.dart';
import 'package:providerarch/core/services/mock_api.dart';
import 'package:providerarch/locator.dart';
import 'package:providerarch/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  MockApi _api = locator<MockApi>();
  List<Post> posts;
  String userName;

  Future getPosts() async {
    setBusy(true);
    posts = await _api.getPostsForUser(currentUser.id);
    print("Post: ${posts.length}, $posts");
    setBusy(false);
  }

  Future getUserName() async {
    setBusy(true);
    userName = currentUser.name;
    setBusy(false);
  }
}
