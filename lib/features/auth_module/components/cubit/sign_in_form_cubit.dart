import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/features/auth_module/components/sign_in_form.dart';

class SignInFormCubit extends Cubit<SignInFormState> {
  SignInFormCubit() : super(SignInFormInitial());
}
