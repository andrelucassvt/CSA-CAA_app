import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_all_interacoes_usecase.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/post_cadastro_paciente_usecase.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

part 'cadastro_paciente_event.dart';
part 'cadastro_paciente_state.dart';

class CadastroPacienteBloc extends Bloc<CadastropacienteEvent, CadastroPacienteState> {
  final PostCadastroPacienteUsecase postCadastroPacienteUsecase;
  CadastroPacienteBloc(
    this.postCadastroPacienteUsecase,
  ) : super(CadastroPacienteInitial()) {
    on<CadastropacienteEvent>((event, emit) async{
      if (event is CadastrarPacienteEvent) {
        emit(CadastroPacienteLoading());
        final result = await postCadastroPacienteUsecase(event.pacienteEntity);
        emit(result.fold(
          (failure) => CadastrarPacienteFailure(failure), 
          (sucess) => CadastrarPacienteSucess())
        );
      }
    });
  }

}
