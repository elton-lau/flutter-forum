import 'package:providerarch/core/services/mock_api.dart';
import 'package:providerarch/locator.dart';

class AuthenticationService {
  MockApi _api = locator<MockApi>();

  Future<bool> login(int userId) async {
    //get the user profile for id
    var fetchedUser = await _api.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    return hasUser;
  }
}
