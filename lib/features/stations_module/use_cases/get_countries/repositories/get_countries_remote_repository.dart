import 'package:radio_app/core/entities/country_entity.dart';

abstract class GetCountriesRemoteRepository {
  Future<List<CountryEntity>> getCountries();
}
