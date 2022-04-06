import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_all_interacoes_usecase.dart';
import 'package:projeto_csa_app/app/shared/common/error/failure.dart';

part 'get_all_interacoes_state.dart';

class GetAllInteracoesCubit extends Cubit<GetAllInteracoesState> {
  GetAllInteracoesCubit(
    this.getAllInteracoesUsecase,
  ) : super(GetAllInteracoesInitial());
  final GetAllInteracoesUsecase getAllInteracoesUsecase;

  Future<void> getAllInteracoes(PacienteEntity pacienteEntity) async {
    emit(GetAllInteracoesLoading());
    final result = await getAllInteracoesUsecase(pacienteEntity);
    emit(result.fold(
      (failure) => GetAllInteracoeFailure(failure),
      (interacoes) => GetAllInteracoeSucess(interacoes),
    ));
  }
}
