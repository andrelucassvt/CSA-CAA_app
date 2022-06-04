import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/get_all_interacoes_usecase.dart';

part 'escolher_interacoes_state.dart';

class EscolherInteracoesCubit extends Cubit<EscolherInteracoesState> {
  final GetAllInteracoesUsecase getAllInteracoesUsecase;
  EscolherInteracoesCubit({
    required this.getAllInteracoesUsecase,
  }) : super(EscolherInteracoesInitial());

  Future<void> getAllInteracoes(PacienteEntity pacienteEntity) async {
    emit(EscolherInteracoesLoading());
    final result = await getAllInteracoesUsecase(pacienteEntity);
    result.fold(
      (failure) => emit(EscolherInteracoesFailure(failure)),
      (interacoes) => emit(EscolherInteracoesLoaded(interacoes)),
    );
  }

}
