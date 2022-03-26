import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:projeto_csa_app/app/modules/auth/domain/usecases/login_medico_usecase.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/usecases/login_paciente_usecase.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginMedicoUsecase loginMedicoUsecase;
  final LoginPacienteUsecase loginPacienteUsecase;
  LoginCubit(
    this.loginMedicoUsecase,
    this.loginPacienteUsecase,
  ) : super(LoginInitial());

  final focusNode = FocusNode();

  Future<void> loginPaciente(String cpf) async {
    emit(LoginLoading());
    focusNode.unfocus();
    if (cpf.isEmpty || cpf.length < 11) return emit(LoginDataisEmpty());
    var result = await loginPacienteUsecase(cpf);
    emit(result.fold(
      (failure) => LoginFailure(failure), 
      (sucess) => LoginSucess())
    );
  }

  Future<void> loginMedico({required String email, required String senha}) async {
    emit(LoginLoading());
    if(email.isEmpty || senha.isEmpty || email.length < 11) return emit(LoginDataisEmpty());
    var result = await loginMedicoUsecase(email: email,senha: senha);
    emit(result.fold(
      (failure) => LoginFailure(failure), 
      (sucess) => LoginSucess())
    );
  }
}
