import 'package:get_it/get_it.dart';
import 'package:radio_app/abstractions/injector.dart';

class GetItInjector implements Injector {
  static final GetItInjector _singleton = GetItInjector._internal();
  final GetIt _getIt = GetIt.asNewInstance();

  factory GetItInjector() {
    return _singleton;
  }

  GetItInjector._internal();

  @override
  void registerFactory<T>(factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerFactory<T>(factoryFunc);
  }

  @override
  void registerFactoryByName<T>(factoryFunc, String name) {
    if (_getIt.isRegistered<T>(instanceName: name)) {
      _getIt.unregister<T>(instanceName: name);
    }
    _getIt.registerFactory<T>(
      factoryFunc,
      instanceName: name,
    );
  }

  @override
  void registerLazySingleton<T>(factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerLazySingleton(factoryFunc);
  }

  @override
  T resolve<T>() {
    return _getIt.get<T>();
  }
}
