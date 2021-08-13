import 'package:equatable/equatable.dart';
import 'package:radio_app/core/entities/country_paginated_result_entity.dart';
import 'package:radio_app/core/interfaces/use_case_output.dart';

class GetCountriesOutput extends Equatable implements UseCaseOutput {
  final List<String> errors;
  final CountryPaginatedResultEntity countriesResult;

  GetCountriesOutput({
    this.countriesResult,
    this.errors,
  }) : assert(countriesResult != null || errors != null);

  @override
  List<Object> get props => [countriesResult];

  @override
  bool hasErrors() => getErrors() != null && getErrors().isNotEmpty;

  @override
  List<String> getErrors() => this.errors;
}
