import 'package:get_it/get_it.dart';
import 'package:project_template/caches/preferences.dart';
import 'package:project_template/providers/network_provider.dart';
import 'package:project_template/ui/home/home_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NetworkProvider());
  locator.registerLazySingleton(() => Preferences());
  locator.registerLazySingleton(() => HomeViewModel());
}
