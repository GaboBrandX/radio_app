import 'package:flutter/material.dart';
import 'package:radio_app/abstractions/http_client.dart';
import 'package:radio_app/abstractions/injector.dart';
import 'package:radio_app/features/stations_module/components/countries_list/cubit/countries_list_cubit.dart';
import 'package:radio_app/features/stations_module/pages/countries_page.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/data/get_countries_remote_repository_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/interactor/get_countries_use_case.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/interactor/get_countries_use_case_impl.dart';
import 'package:radio_app/features/stations_module/use_cases/get_countries/repositories/get_countries_remote_repository.dart';

abstract class StationsModule {
  static const String CountriesRoute = '/countries';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      CountriesRoute: (context) => CountriesPage(),
    };
  }

  static void registerDependencies(Injector injector) {
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
}
