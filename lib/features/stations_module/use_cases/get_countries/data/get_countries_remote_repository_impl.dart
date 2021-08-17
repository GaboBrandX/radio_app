import 'package:flutter/foundation.dart';
import 'package:radio_app/abstractions/http_client.dart';
import 'package:radio_app/core/entities/country_entity.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/repositories/get_countries_remote_repository.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/repositories/get_countries_remote_repository_output.dart';

class GetCountriesRemoteRepositoryImpl implements GetCountriesRemoteRepository {
  final String _baseUrl;
  final String _apiKey;
  final String _apiHost;
  final HttpClient _httpClient;
  static const String _countriesEndpoint = '/v1/countries/getAll';

  GetCountriesRemoteRepositoryImpl({
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

  List<String> _errors = [];

  @override
  Future<GetCountriesRemoteRepositoryOutput> getCountries() async {
    var url = '$_baseUrl$_countriesEndpoint';
    await _httpClient.addHeaders({
      'x-rapidapi-key': _apiKey,
      'x-rapidapi-host': _apiHost,
      'useQueryString': true,
    });
    var response = await _httpClient.get(url);

    if (response.isOk()) {
      if ((response.data as List<dynamic>).isEmpty) {
        _errors.add('Empty results');
      } else {
        return GetCountriesRemoteRepositoryOutput(
            countries: _mapApiData(response.data));
      }
    } else {
      switch (response.statusCode) {
        case 404:
          break;
        default:
          break;
      }
    }

    return GetCountriesRemoteRepositoryOutput(errors: _errors);
  }

  List<CountryEntity> _mapApiData(Map<dynamic, dynamic> data) {
    var list = (data['countries'] as List<dynamic>);
    return list
        .map(
          (e) => CountryEntity(e['name'], e['country_code']),
        )
        .toList();
  }
}
