import 'package:radio_app/core/entities/radio_station_entity.dart';

abstract class GetTopStationsByCountryRemoteRepository {
  Future<List<RadioStationEntity>> getTopStations(String countryCode);
}
