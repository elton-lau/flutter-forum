import 'dart:async';

import 'package:providerarch/core/models/user.dart';
import 'package:providerarch/core/services/mock_api.dart';
import 'package:providerarch/locator.dart';

class AuthenticationService {
  MockApi _api = locator<MockApi>();
  User _currentUser;
  User get currentUser => _currentUser;

  Future<bool> login(int userId) async {
    try {
      var fetchedUser = await _api.getUserProfile(userId);
      // create a new user profile on firestore
      bool hasUser = fetchedUser != null;
      if (fetchedUser != null) {
        _currentUser = User(
            id: fetchedUser.id,
            userName: fetchedUser.userName,
            name: fetchedUser.name);
        return hasUser;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
