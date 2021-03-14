import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/features/stations_module/components/top_stations_by_country/cubit/top_stations_by_country_state.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/interactor/get_current_country_use_case.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/interactor/get_top_stations_by_country_use_case.dart';

class TopStationsByCountryCubit extends Cubit<TopStationsByCountryState> {
  final GetCurrentCountryUseCase _getCurrentCountryUseCase;
  final GetTopStationsByCountryUseCase _getTopStationsByCountryUseCase;

  TopStationsByCountryCubit({
    @required GetCurrentCountryUseCase getCurrentCountryUseCase,
    @required GetTopStationsByCountryUseCase getTopStationsByCountryUseCase,
  })  : _getCurrentCountryUseCase = getCurrentCountryUseCase,
        _getTopStationsByCountryUseCase = getTopStationsByCountryUseCase,
        assert(getCurrentCountryUseCase != null),
        assert(getTopStationsByCountryUseCase != null),
        super(TopStationsByCountryInitial());

  Future<void> getTopStations() async {
    emit(TopStationsByCountryLoading());

    var currentCountry = await _getCurrentCountryUseCase.execute();
    var result = await _getTopStationsByCountryUseCase
        .execute(currentCountry.countryCode);

    emit(TopStationsByCountryLoaded(result.stations));
  }
}
