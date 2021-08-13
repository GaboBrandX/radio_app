import 'package:flutter/material.dart';
import 'package:radio_app/abstractions/http_client.dart';
import 'package:radio_app/abstractions/injector.dart';
import 'package:radio_app/abstractions/navigation_manager.dart';
import 'package:radio_app/features/stations_module/components/countries_list/cubit/countries_list_cubit.dart';
import 'package:radio_app/features/stations_module/components/top_stations_by_country/cubit/top_stations_by_country_cubit.dart';
import 'package:radio_app/features/stations_module/pages/countries_page.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/data/get_countries_remote_repository_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/interactor/get_countries_use_case.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/interactor/get_countries_use_case_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/repositories/get_countries_remote_repository.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/data/get_current_country_local_repository_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/interactor/get_current_country_use_case.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/interactor/get_current_country_use_case_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_current_country/repositories/get_current_country_local_repository.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/data/get_top_stations_by_country_remote_repository_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/interactor/get_top_stations_by_country_use_case.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/interactor/get_top_stations_by_country_use_case_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_top_stations_by_country/repositories/get_top_stations_by_country_remote_repository.dart';
import 'package:radio_app/infrastructure/ioc_manager.dart';

abstract class StationsModule {
  static const String CountriesRoute = '/countries';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      CountriesRoute: (context) => CountriesPage(),
    };
  }

  static void registerDependencies(Injector injector) {
    _registerGetCountriesFeature(injector);
    _registerGetCurrentCountryFeature(injector);
    _registerGetTopStationsByCountryFeature(injector);
  }

  static void _registerGetTopStationsByCountryFeature(Injector injector) {
    injector.registerFactory<GetTopStationsByCountryRemoteRepository>(
      () => GetTopStationsByCountryRemoteRepositoryImpl(
        baseUrl: injector.resolveByName('baseUrl'),
        apiKey: injector.resolveByName('apiKey'),
        apiHost: injector.resolveByName('apiHost'),
        httpClient: injector.resolve<HttpClient>(),
      ),
    );

    injector.registerFactory<GetTopStationsByCountryUseCase>(
      () => GetTopStationsByCountryUseCaseImpl(
        remoteRepository:
            injector.resolve<GetTopStationsByCountryRemoteRepository>(),
      ),
    );

    injector.registerFactory<TopStationsByCountryCubit>(
      () => TopStationsByCountryCubit(
        getCurrentCountryUseCase: injector.resolve<GetCurrentCountryUseCase>(),
        getTopStationsByCountryUseCase:
            injector.resolve<GetTopStationsByCountryUseCase>(),
      ),
    );
  }

  static void _registerGetCurrentCountryFeature(Injector injector) {
    injector.registerFactory<GetCurrentCountryLocalRepository>(
      () => GetCurrentCountryLocalRepositoryImpl(),
    );

    injector.registerFactory<GetCurrentCountryUseCase>(
      () => GetCurrentCountryUseCaseImpl(
        repository: injector.resolve<GetCurrentCountryLocalRepository>(),
      ),
    );
  }

  static void _registerGetCountriesFeature(Injector injector) {
    injector.registerFactory<GetCountriesRemoteRepository>(
      () => GetCountriesRemoteRepositoryImpl(
        baseUrl: injector.resolveByName('baseUrl'),
        apiKey: injector.resolveByName('apiKey'),
        apiHost: injector.resolveByName('apiHost'),
        httpClient: injector.resolve<HttpClient>(),
      ),
    );

    injector.registerFactory<GetCountriesUseCase>(
      () => GetCountriesUseCaseImpl(
        remoteRepository: injector.resolve<GetCountriesRemoteRepository>(),
      ),
    );

    injector.registerFactory<CountriesListCubit>(
      () => CountriesListCubit(
        getCountriesUseCase: injector.resolve<GetCountriesUseCase>(),
      ),
    );
  }

  static Future<void> navigateToCountriesPage(BuildContext context) async {
    var navigator = IocManager.getInstance().resolve<NavigationManager>();
    await navigator.push(CountriesRoute, context);
  }
}
