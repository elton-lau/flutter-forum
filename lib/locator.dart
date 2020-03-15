import 'package:get_it/get_it.dart';
import 'package:providerarch/core/services/authentication_service.dart';
import 'package:providerarch/viewmodels/comments_view_model.dart';

import 'core/services/mock_api.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => MockApi());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerFactory(() => CommentsViewModel());
}
