import 'package:radio_app/features/stations_module/use_cases/get_countries/input_output/get_countries_output.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/interactor/get_countries.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/repositories/get_countries_remote_repository.dart';

class GetCountriesImpl implements GetCountries {
  final GetCountriesRemoteRepository _remoteRepository;

  GetCountriesImpl({
    GetCountriesRemoteRepository remoteRepository,
  }) : _remoteRepository = remoteRepository;

  @override
  Future<GetCountriesOutput> execute() async {
    var countries = await _remoteRepository.getCountries();
    return GetCountriesOutput(countries);
  }
}
