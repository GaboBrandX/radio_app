import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/features/stations_module/components/top_stations_by_country/cubit/top_stations_by_country_state.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/interactor/get_current_country_use_case.dart';

class TopStationsByCountryCubit extends Cubit<TopStationsByCountryState> {
  final GetCurrentCountryUseCase _getCurrentCountryUseCase;

  TopStationsByCountryCubit({
    GetCurrentCountryUseCase getCurrentCountryUseCase,
  })  : _getCurrentCountryUseCase = getCurrentCountryUseCase,
        super(TopStationsByCountryInitial());

  Future<void> getTopStations() async {
    emit(TopStationsByCountryLoading());

    var currentCountry = await _getCurrentCountryUseCase.execute();
  }
}
