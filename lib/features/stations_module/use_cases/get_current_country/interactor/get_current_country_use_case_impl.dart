import 'package:flutter/foundation.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/input_output/get_current_country_output.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/interactor/get_current_country_use_case.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/repositories/get_current_country_local_repository.dart';

class GetCurrentCountryUseCaseImpl implements GetCurrentCountryUseCase {
  final GetCurrentCountryLocalRepository _repository;

  GetCurrentCountryUseCaseImpl({
    @required GetCurrentCountryLocalRepository repository,
  })  : _repository = repository,
        assert(repository != null);

  @override
  Future<GetCurrentCountryOutput> execute() async {
    var response = await _repository.getCurrentCountryCode();
    return GetCurrentCountryOutput(response);
  }
}
