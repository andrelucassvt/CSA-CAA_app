part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashTelaDeLogin extends SplashState {}

class SplashTelaDeHome extends SplashState {}