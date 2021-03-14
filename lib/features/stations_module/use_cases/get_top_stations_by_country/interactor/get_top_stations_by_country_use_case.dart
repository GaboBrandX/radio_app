import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/input_output/get_top_stations_by_country_output.dart';

abstract class GetTopStationsByCountryUseCase {
  Future<GetTopStationsByCountryOutput> execute(String countryCode);
}
