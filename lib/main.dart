import 'package:flutter/material.dart';
import 'package:radio_app/application/application.dart';
import 'package:radio_app/infrastructure/ioc_manager.dart';

void main() {
  IocManager.register();
  runApp(Application());
}
