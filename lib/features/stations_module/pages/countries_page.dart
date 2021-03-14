import 'package:flutter/material.dart';
import 'package:radio_app/features/stations_module/components/countries_list/cubit/countries_list_cubit.dart';
import 'package:radio_app/features/stations_module/components/countries_list/presentation/countries_list_component.dart';
import 'package:radio_app/infrastructure/ioc_manager.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CountriesListComponent(
        cubit: IocManager.getInstance().resolve<CountriesListCubit>(),
      ),
    );
  }
}
