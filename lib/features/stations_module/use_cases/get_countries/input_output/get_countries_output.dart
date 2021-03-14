import 'package:equatable/equatable.dart';
import 'package:radio_app/core/entities/country_entity.dart';

class GetCountriesOutput extends Equatable {
  final List<CountryEntity> countries;

  GetCountriesOutput(
    this.countries,
  ) : assert(countries != null);

  @override
  List<Object> get props => [countries];
}
