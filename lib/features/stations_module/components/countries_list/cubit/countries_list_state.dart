import 'package:equatable/equatable.dart';
import 'package:radio_app/core/entities/country_entity.dart';

abstract class CountriesListState extends Equatable {
  @override
  List<Object> get props => [];
}

class CountriesListInitial extends CountriesListState {}

class CountriesListLoading extends CountriesListState {}

class CountriesListLoaded extends CountriesListState {
  final List<CountryEntity> countries;

  CountriesListLoaded(this.countries);

  @override
  List<Object> get props => [countries];
}

class CountriesListError extends CountriesListState {
  final List<String> errors;

  CountriesListError(this.errors);

  @override
  List<Object> get props => [errors];
}
