typedef FactoryFunc<T> = T Function();

abstract class Injector {
  static Injector instance;

  void registerFactory<T>(FactoryFunc<T> factoryFunc);

  void registerLazySingleton<T>(FactoryFunc<T> factoryFunc);

  T resolve<T>();

  static Injector register(Injector implementation) {
    instance = implementation;
    return instance;
  }
}
