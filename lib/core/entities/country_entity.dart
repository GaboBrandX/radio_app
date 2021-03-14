class CountryEntity {
  final String name;
  final String countryCode;

  CountryEntity(
    this.name,
    this.countryCode,
  )   : assert(name != null && name.isNotEmpty),
        assert(countryCode != null && countryCode.isNotEmpty);
}
