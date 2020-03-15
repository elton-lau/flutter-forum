import 'package:providerarch/core/services/authentication_service.dart';
import 'package:providerarch/locator.dart';
import 'package:providerarch/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.parse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
