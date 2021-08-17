import 'package:radio_app/core/entities/country_entity.dart';
import 'package:radio_app/core/interfaces/use_case_output.dart';

class GetCountriesRemoteRepositoryOutput implements ErrorNotifier {
  final List<CountryEntity> countries;
  final List<String> errors;

  GetCountriesRemoteRepositoryOutput({
    this.countries,
    this.errors,
  });

  @override
  List<String> getErrors() {
    // TODO: implement getErrors
    throw UnimplementedError();
  }

  @override
  bool hasErrors() {
    // TODO: implement hasErrors
    throw UnimplementedError();
  }
}
