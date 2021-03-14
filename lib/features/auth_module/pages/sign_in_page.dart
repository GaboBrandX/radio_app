import 'package:flutter/material.dart';
import 'package:radio_app/features/auth_module/components/sign_in_form.dart';
import 'package:radio_app/ioc/ioc_manager.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildSignInFormComponent(),
      ),
    );
  }

  SignInFormComponent _buildSignInFormComponent() {
    return SignInFormComponent(
      cubit: IocManager.getInstance().resolve<SignInFormCubit>(),
    );
  }
}
