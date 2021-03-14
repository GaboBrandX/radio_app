import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:radio_app/abstractions/http_client.dart';
import 'package:radio_app/core/entities/country_entity.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/data/get_countries_remote_repository_impl.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  group('Get countries remote repository tests', () {
    MockHttpClient _httpClient;

    setUp(() {
      _httpClient = MockHttpClient();
    });

    test('should return a valid http response with countries data', () async {
      var baseUrl = 'https://test.com';
      var apiKey = '12345';
      var apiHost = 'test.com';
      var endpoint = '$baseUrl/v1/countries/getAll';

      var countries = {
        'countries': [
          {'name': 'Argentina', 'country_code': 'AR'},
        ]
      };
      when(_httpClient.get(argThat(equals(endpoint)))).thenAnswer(
          (realInvocation) => Future.value(HttpResponse(countries, 200)));
      var repository = GetCountriesRemoteRepositoryImpl(
        baseUrl: baseUrl,
        apiKey: apiKey,
        apiHost: apiHost,
        httpClient: _httpClient,
      );
      var expectedResult = [CountryEntity('Argentina', 'AR')];

      var result = await repository.getCountries();

      expect(result, expectedResult);
      verify(_httpClient.get(endpoint)).called(1);
      verify(_httpClient.addHeaders(any)).called(1);
      verifyNoMoreInteractions(_httpClient);
    });
  });
}
