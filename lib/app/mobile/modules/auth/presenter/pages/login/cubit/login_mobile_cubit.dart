import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/usecase/login_mobile_usecase.dart';

part 'login_mobile_state.dart';

class LoginMobileCubit extends Cubit<LoginMobileState> {
  LoginMobileCubit({
    required this.loginMobileUseCase,
  }) : super(LoginMobileInitial());

  final LoginMobileUseCase loginMobileUseCase;

  final focusNode = FocusNode();

  Future<void> login(String cpf) async {
    emit(LoginMobileLoading());
    if (cpf.isEmpty || cpf.length < 11) return emit(LoginMobileDataisEmpty());
    var result = await loginMobileUseCase(cpf: cpf);
    emit(result.fold(
      (failure) => LoginMobileFailure(failure),
      (sucess) => LoginMobileSucess(),
    ));
  }
  
}
