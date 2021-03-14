import 'package:equatable/equatable.dart';
import 'package:radio_app/core/entities/radio_station_entity.dart';

abstract class TopStationsByCountryState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopStationsByCountryInitial extends TopStationsByCountryState {}

class TopStationsByCountryLoading extends TopStationsByCountryState {}

class TopStationsByCountryLoaded extends TopStationsByCountryState {
  final List<RadioStationEntity> stations;

  TopStationsByCountryLoaded(this.stations);

  @override
  List<Object> get props => [stations];
}
