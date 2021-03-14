import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;
  final String countryCode;

  CountryEntity(
    this.name,
    this.countryCode,
  )   : assert(name != null && name.isNotEmpty),
        assert(countryCode != null && countryCode.isNotEmpty);

  @override
  List<Object> get props => [name, countryCode];
}
