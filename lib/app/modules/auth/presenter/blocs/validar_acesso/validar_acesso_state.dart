part of 'validar_acesso_cubit.dart';

@immutable
abstract class ValidarAcessoState {}

class ValidarAcessoInitial extends ValidarAcessoState {}

class ValidarAcessoTelaDeLogin extends ValidarAcessoState {}

class ValidarAcessoHome extends ValidarAcessoState {}
