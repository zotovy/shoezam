import 'package:get_it/get_it.dart';
import 'package:shoezam/core/services/images.dart';
import 'package:shoezam/core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

/// Called ont time before runApp()
void setupLocator() {
  locator.registerLazySingleton<ImageServices>(() => ImageServices());
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
