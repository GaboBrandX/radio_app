import 'package:flutter/material.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/repositories/get_current_country_local_repository.dart';

class GetCurrentCountryLocalRepositoryImpl
    implements GetCurrentCountryLocalRepository {
  @override
  Future<String> getCurrentCountryCode() {
    return Future.value(WidgetsBinding.instance.window.locale.countryCode);
  }
}
