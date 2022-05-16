import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/get_interacoes_do_paciente_usecase.dart';

part 'detalhes_paciente_state.dart';

class DetalhesPacienteCubit extends Cubit<DetalhesPacienteState> {

  final GetInteracoesDoPacienteUsecase getInteracoesDoPacienteUsecase;
  DetalhesPacienteCubit({required this.getInteracoesDoPacienteUsecase})
       : super(DetalhesPacienteInitial());

  Future<void> getInteracoesPaciente(String cpf) async {
    emit(DetalhesPacienteLoading());
    final result = await getInteracoesDoPacienteUsecase(cpf: cpf);
    emit(result.fold(
      (failure) => DetalhesPacienteFailure(failure),
      (interacoes) => DetalhesPacienteSucess(interacoes),
    ));

  }
}
