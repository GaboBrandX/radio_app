import 'package:flutter/material.dart';

abstract class NavigationManager {
  Future<T> push<T extends Object>(String route, BuildContext context);
}
