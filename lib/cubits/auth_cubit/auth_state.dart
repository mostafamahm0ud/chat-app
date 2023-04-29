part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}


class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  String errMassage;
  LoginFailure({required this.errMassage});
}


class RegistrLoading extends AuthState {}

class RegistrSuccess extends AuthState {}

class RegistrFailure extends AuthState {
  String errMassage;
  RegistrFailure({required this.errMassage});
}
