import 'package:flutter/widgets.dart';
import 'package:providerarch/core/models/user.dart';
import 'package:providerarch/core/services/authentication_service.dart';
import 'package:providerarch/locator.dart';

class BaseModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  User get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
