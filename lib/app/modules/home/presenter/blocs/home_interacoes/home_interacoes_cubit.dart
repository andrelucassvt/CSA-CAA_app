import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_interacoes_do_paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_pacientes.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

part 'home_interacoes_state.dart';

class HomeInteracoesCubit extends Cubit<HomeInteracoesState> {
  final GetInteracoesDoPacienteUsecase getInteracoesDoPacienteUsecase;
  final GetPacientesUseCase getPacientesUseCase;
  HomeInteracoesCubit(
    this.getInteracoesDoPacienteUsecase, 
    this.getPacientesUseCase,
  ) : super(HomeInteracoesInitial());

  Future<void> getInteracoesDoPaciente() async {
    emit(HomeInteracoesLoading());
    var result = await getInteracoesDoPacienteUsecase();
    emit(result.fold(
      (failure) => HomeInteracoesFailure(failure), 
      (sucess) => InteracoesPacienteSonsSucess(sucess))
    );
  }

  Future<void> getPacientes() async {
    print('oi');
    emit(HomeInteracoesLoading());
    var result = await getPacientesUseCase();
    emit(result.fold(
      (failure) => HomeInteracoesFailure(failure), 
      (sucess) => InteracoesMedicoPacientesSucess(sucess))
    );
  }

}
