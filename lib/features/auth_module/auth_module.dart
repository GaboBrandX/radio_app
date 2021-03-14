import 'package:flutter/material.dart';
import 'package:radio_app/abstractions/injector.dart';
import 'package:radio_app/features/auth_module/components/sign_in_form.dart';
import 'package:radio_app/features/auth_module/pages/sign_in_page.dart';

class AuthModule {
  static const String SignInRoute = '/sign_in';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      SignInRoute: (context) => SignInPage(),
    };
  }

  static void registerDependencies(Injector injector) {
    injector.registerFactory<SignInFormCubit>(() => SignInFormCubit());
  }
}
