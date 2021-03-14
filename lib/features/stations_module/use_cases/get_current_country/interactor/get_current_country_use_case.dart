import 'package:radio_app/features/stations_module/use_cases/get_current_country/input_output/get_current_country_output.dart';

abstract class GetCurrentCountryUseCase {
  Future<GetCurrentCountryOutput> execute();
}
