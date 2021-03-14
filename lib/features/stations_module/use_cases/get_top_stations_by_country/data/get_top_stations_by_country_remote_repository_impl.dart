import 'package:flutter/foundation.dart';
import 'package:radio_app/abstractions/http_client.dart';
import 'package:radio_app/core/entities/radio_station_entity.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/repositories/get_top_stations_by_country_remote_repository.dart';

class GetTopStationsByCountryRemoteRepositoryImpl
    implements GetTopStationsByCountryRemoteRepository {
  final String _baseUrl;
  final String _apiKey;
  final String _apiHost;
  final HttpClient _httpClient;
  static const String _topStationsByCountryEndpoint =
      '/v1/radios/getTopByCountry';

  GetTopStationsByCountryRemoteRepositoryImpl({
    @required String baseUrl,
    @required String apiKey,
    @required String apiHost,
    @required HttpClient httpClient,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _apiHost = apiHost,
        _httpClient = httpClient,
        assert(baseUrl != null),
        assert(apiKey != null),
        assert(apiHost != null),
        assert(httpClient != null);

  @override
  Future<List<RadioStationEntity>> getTopStations(String countryCode) async {
    var url = '$_baseUrl$_topStationsByCountryEndpoint?query=$countryCode';
    await _httpClient.addHeaders({
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
      'useQueryString': true,
    });
    var response = await _httpClient.get(url);

    if (response.isOk()) {
      return _mapApiData(response.data);
    }

    return null;
  }

  List<RadioStationEntity> _mapApiData(Map<dynamic, dynamic> data) {
    var list = data['radios'] as List<dynamic>;
    return list
        .map(
          (e) => RadioStationEntity(
            e['name'],
            e['image_url'],
            e['uri'],
            e['country_code'],
            e['genre'].split(','),
          ),
        )
        .toList();
  }
}
