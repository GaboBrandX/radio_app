import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:radio_app/core/commons/mg_button.dart';
import 'package:radio_app/core/commons/mg_text_form_field.dart';
import 'package:radio_app/features/auth_module/components/sign_in_form.dart';

class SignInFormComponent extends StatelessWidget {
  final SignInFormCubit _cubit;

  SignInFormComponent({
    Key key,
    @required SignInFormCubit cubit,
  })  : _cubit = cubit,
        assert(cubit != null),
        super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocConsumer<SignInFormCubit, SignInFormState>(
        bloc: _cubit,
        listener: (oldState, newState) {},
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MgTextFormField(
                controller: _emailController,
                label: AppLocalizations.of(context).email_label,
              ),
              MgTextFormField(
                controller: _passwordController,
                label: AppLocalizations.of(context).password_label,
              ),
              MgButton(
                label: AppLocalizations.of(context).sign_in_label,
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
