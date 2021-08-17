import 'package:radio_app/features/stations_module/use_cases/get_countries/repositories/get_countries_remote_repository_output.dart';

abstract class GetCountriesRemoteRepository {
  Future<GetCountriesRemoteRepositoryOutput> getCountries();
}
