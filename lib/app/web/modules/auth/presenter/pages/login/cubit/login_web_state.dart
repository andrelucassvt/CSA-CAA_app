part of 'login_web_cubit.dart';

@immutable
abstract class LoginWebState {}

class LoginWebInitial extends LoginWebState {}

class LoginWebLoading extends LoginWebState {}

class LoginWebSucess extends LoginWebState {}

class LoginWebDataisEmpty extends LoginWebState {}

class LoginWebEmailInvalid extends LoginWebState {}

class LoginWebFailure extends LoginWebState {
  final Failure error;
  LoginWebFailure({
    required this.error,
  });
}
