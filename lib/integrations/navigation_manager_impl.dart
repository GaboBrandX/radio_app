import 'package:flutter/material.dart';
import 'package:radio_app/abstractions/navigation_manager.dart';

class NavigationManagerImplementation implements NavigationManager {
  @override
  Future<T> push<T extends Object>(String route, BuildContext context) {
    return Navigator.of(context).pushNamed(route);
  }
}
