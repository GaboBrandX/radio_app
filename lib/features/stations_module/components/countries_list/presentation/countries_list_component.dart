import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/core/commons/mg_activity_indicator.dart';
import 'package:radio_app/core/commons/mg_bloc_provider.dart';
import 'package:radio_app/core/commons/mg_button.dart';
import 'package:radio_app/features/stations_module/components/countries_list/countries_list.dart';

class CountriesListComponent extends StatelessWidget {
  final CountriesListCubit _cubit;

  const CountriesListComponent({
    Key key,
    @required CountriesListCubit cubit,
  })  : _cubit = cubit,
        assert(cubit != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MgBlocProvider(
      create: (_) => _cubit..getCountries(),
      child: BlocBuilder<CountriesListCubit, CountriesListState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is CountriesListLoaded) {
            return ListView(
              children: state.countries.map((e) => Text(e.name)).toList(),
            );
          }

          if (state is CountriesListLoading) {
            return MgActivityIndicator();
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: MgButton(
                label: 'Load countries',
                onPressed: () => _cubit.getCountries(),
              ),
            ),
          );
        },
      ),
    );
  }
}
