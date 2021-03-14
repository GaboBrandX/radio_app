import 'package:mockito/mockito.dart';
import 'package:radio_app/core/entities/country_entity.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/input_output/get_countries_output.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/interactor/get_countries_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/repositories/get_countries_remote_repository.dart';
import 'package:test/test.dart';

class MockGetCountriesRemoteRepository extends Mock
    implements GetCountriesRemoteRepository {}

void main() {
  group('GetCountries interactor tests', () {
    MockGetCountriesRemoteRepository _mockGetCountriesRemoteRepository;

    setUp(() {
      _mockGetCountriesRemoteRepository = MockGetCountriesRemoteRepository();
    });

    test('should return a list of countries', () async {
      var countries = [CountryEntity('Argentina', 'ar')];
      when(_mockGetCountriesRemoteRepository.getCountries())
          .thenAnswer((realInvocation) => Future.value(countries));
      var useCase =
          GetCountriesImpl(remoteRepository: _mockGetCountriesRemoteRepository);
      var expected = GetCountriesOutput(countries);

      var result = await useCase.execute();

      expect(result, equals(expected));
      verify(_mockGetCountriesRemoteRepository.getCountries()).called(1);
      verifyNoMoreInteractions(_mockGetCountriesRemoteRepository);
    });
  });
}
