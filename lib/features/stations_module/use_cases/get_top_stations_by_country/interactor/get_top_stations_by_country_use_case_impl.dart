import 'package:flutter/foundation.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/input_output/get_top_stations_by_country_output.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/interactor/get_top_stations_by_country_use_case.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/repositories/get_top_stations_by_country_remote_repository.dart';

class GetTopStationsByCountryUseCaseImpl
    implements GetTopStationsByCountryUseCase {
  final GetTopStationsByCountryRemoteRepository _remoteRepository;

  GetTopStationsByCountryUseCaseImpl({
    @required GetTopStationsByCountryRemoteRepository remoteRepository,
  })  : _remoteRepository = remoteRepository,
        assert(remoteRepository != null);

  @override
  Future<GetTopStationsByCountryOutput> execute(String countryCode) async {
    var radios = await _remoteRepository.getTopStations(countryCode);
    return GetTopStationsByCountryOutput(radios);
  }
}
