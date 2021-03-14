import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/features/stations_module/components/countries_list/countries_list.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/interactor/get_countries_use_case.dart';

class CountriesListCubit extends Cubit<CountriesListState> {
  final GetCountriesUseCase _getCountriesUseCase;

  CountriesListCubit({
    GetCountriesUseCase getCountriesUseCase,
  })  : _getCountriesUseCase = getCountriesUseCase,
        super(CountriesListInitial());

  Future<void> getCountries() async {
    emit(CountriesListLoading());

    var result = await _getCountriesUseCase.execute();
    if (result != null &&
        result.countries != null &&
        result.countries.isNotEmpty) {
      emit(CountriesListLoaded(result.countries));
    }
  }
}
