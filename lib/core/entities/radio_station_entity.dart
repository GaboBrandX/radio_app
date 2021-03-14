import 'package:equatable/equatable.dart';

class RadioStationEntity extends Equatable {
  final String name;
  final String imageUrl;
  final String uri;
  final String countryCode;
  final List<String> genres;

  RadioStationEntity(
    this.name,
    this.imageUrl,
    this.uri,
    this.countryCode,
    this.genres,
  );

  @override
  List<Object> get props => [name, imageUrl, uri, countryCode, genres];
}
