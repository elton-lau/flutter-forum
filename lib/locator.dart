import 'package:get_it/get_it.dart';
import 'package:providerarch/core/services/authentication_service.dart';

import 'core/services/mock_api.dart';
import 'viewmodels/login_view_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => MockApi());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => AuthenticationService());
}
