import 'package:radio_app/abstractions/injector.dart';
import 'package:radio_app/application/application.dart';
import 'package:radio_app/features/auth_module/auth_module.dart';
import 'package:radio_app/integrations/get_it_injector.dart';

abstract class IocManager {
  static Injector _injector;

  static void register() {
    _injector = Injector.register(GetItInjector());

    Application.registerDependencies(_injector);
    AuthModule.registerDependencies(_injector);
  }

  static Injector getInstance() => _injector;
}
