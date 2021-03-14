import 'package:equatable/equatable.dart';

abstract class SignInFormState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInFormInitial extends SignInFormState {}

class SignInFormLoading extends SignInFormState {}

class SignInFormSuccess extends SignInFormState {}
