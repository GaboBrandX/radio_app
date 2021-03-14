import 'package:equatable/equatable.dart';

abstract class TopStationsByCountryState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopStationsByCountryInitial extends TopStationsByCountryState {}

class TopStationsByCountryLoading extends TopStationsByCountryState {}
