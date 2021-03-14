import 'package:flutter/foundation.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/input_output/get_countries_output.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/interactor/get_countries_use_case.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/repositories/get_countries_remote_repository.dart';

class GetCountriesUseCaseImpl implements GetCountriesUseCase {
  final GetCountriesRemoteRepository _remoteRepository;

  GetCountriesUseCaseImpl({
    @required GetCountriesRemoteRepository remoteRepository,
  })  : assert(remoteRepository != null),
        _remoteRepository = remoteRepository;

  @override
  Future<GetCountriesOutput> execute() async {
    var countries = await _remoteRepository.getCountries();
    return GetCountriesOutput(countries);
  }
}
