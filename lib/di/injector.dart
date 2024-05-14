import 'package:get_it/get_it.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/data/api/api_services.dart';
import 'package:ttn_flix/utilities/db_manager.dart';
import 'package:ttn_flix/utilities/file_manager.dart';

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
