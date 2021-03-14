import 'package:radio_app/features/stations_module/use_cases/get_countries/input_output/get_countries_output.dart';

abstract class GetCountries {
  Future<GetCountriesOutput> execute();
}
