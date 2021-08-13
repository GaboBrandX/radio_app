import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MgBlocProvider<T extends Cubit> extends StatelessWidget {
  final Function(BuildContext) _create;
  final Widget _child;

  const MgBlocProvider({
    Key key,
    @required Function(BuildContext) create,
    @required Widget child,
  })  : _create = create,
        _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: this._create,
      child: this._child,
    );
  }
}
