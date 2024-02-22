import 'package:get_it/get_it.dart';
import '../constants/app_shared_prefrence.dart';
import '../data/api/api_services.dart';
import '../utilities/db_manager.dart';
import '../utilities/file_manager.dart';

class AppInjector {
  static final getIt = GetIt.instance;

  void setup() {
    _register(AppSharedPref());
    _register(APIServices());
    _register(DBManager());
    _register(FileManager());
  }

  void _register<T extends Object>(T instance) {
    if (!getIt.isRegistered(instance: instance)) {
      getIt.registerSingleton(instance);
    }
  }
}
