typedef FactoryFunc<T> = T Function();

abstract class Injector {
  static Injector instance;

  void registerFactory<T>(FactoryFunc<T> factoryFunc);

  void registerFactoryByName<T>(FactoryFunc<T> factoryFunc, String name);

  void registerLazySingleton<T>(FactoryFunc<T> factoryFunc);

  T resolve<T>();

  T resolveByName<T>(String name);

  static Injector register(Injector implementation) {
    instance = implementation;
    return instance;
  }
}
