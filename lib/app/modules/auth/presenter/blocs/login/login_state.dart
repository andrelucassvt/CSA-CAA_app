part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucess extends LoginState {}

class LoginDataisEmpty extends LoginState {}

class LoginFailure extends LoginState {
  final Failure error;
  LoginFailure(this.error);
}