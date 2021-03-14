import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:radio_app/abstractions/injector.dart';
import 'package:radio_app/application/application_themes.dart';
import 'package:radio_app/features/auth_module/auth_module.dart';
import 'package:radio_app/infrastructure/environment_config.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ApplicationThemes.light,
      routes: _generateRoutes(),
      initialRoute: AuthModule.SignInRoute,
    );
  }

  static void registerDependencies(Injector injector) {
    injector.registerFactoryByName(
      () => EnvironmentConfig.BASE_URL,
      'baseUrl',
    );
    injector.registerFactoryByName(
      () => EnvironmentConfig.API_KEY,
      'apiKey',
    );
    injector.registerFactoryByName(
      () => EnvironmentConfig.API_HOST,
      'apiHost',
    );
  }

  Map<String, WidgetBuilder> _generateRoutes() {
    return {
      ...AuthModule.generateRoutes(),
    };
  }
}
