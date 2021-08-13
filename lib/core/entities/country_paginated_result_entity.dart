import 'package:radio_app/core/entities/country_entity.dart';

class CountryPaginatedResultEntity {
  final int limit;
  final int offset;
  final List<CountryEntity> countries;

  CountryPaginatedResultEntity(
    this.limit,
    this.offset,
    this.countries,
  );
}
