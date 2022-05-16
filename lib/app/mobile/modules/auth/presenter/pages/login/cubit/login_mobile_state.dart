part of 'login_mobile_cubit.dart';

@immutable
abstract class LoginMobileState {}

class LoginMobileInitial extends LoginMobileState {}

class LoginMobileLoading extends LoginMobileState {}

class LoginMobileSucess extends LoginMobileState {}

class LoginMobileDataisEmpty extends LoginMobileState {}

class LoginMobileEmailInvalid extends LoginMobileState {}

class LoginMobileFailure extends LoginMobileState {
  final Failure error;
  LoginMobileFailure(this.error);
}