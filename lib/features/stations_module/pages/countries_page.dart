import 'package:flutter/material.dart';
import 'package:radio_app/features/stations_module/components/countries_list/cubit/countries_list_cubit.dart';
import 'package:radio_app/features/stations_module/components/countries_list/presentation/countries_list_component.dart';
import 'package:radio_app/features/stations_module/stations_module.dart';
import 'package:radio_app/infrastructure/ioc_manager.dart';

import '../../../core/entities/country_entity.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as CountriesPageParams;

    return Scaffold(
      body: CountriesListComponent(
        cubit: IocManager.getInstance().resolve<CountriesListCubit>(),
        onItemTapped: StationsModule.navigateToCountriesPage,
      ),
    );
  }
}

class CountriesPageParams {
  final CountryEntity country;

  CountriesPageParams(this.country);
}