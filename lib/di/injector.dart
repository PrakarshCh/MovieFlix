import 'package:get_it/get_it.dart';
import '../data/api/api_services.dart';

class AppInjector {
  static final getIt = GetIt.instance;

  void setup() {
    _register(APIServices());
  }

  void _register<T extends Object>(T instance) {
    if (!getIt.isRegistered(instance: instance)) {
      getIt.registerSingleton(instance);
    }
  }
}
