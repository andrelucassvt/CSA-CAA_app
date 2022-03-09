import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

part 'cadastro_paciente_state.dart';

class CadastroPacienteCubit extends Cubit<CadastroPacienteState> {
  CadastroPacienteCubit() : super(CadastroPacienteInitial());

  Future<void> cadastrarPaciente(PacienteEntity pacienteEntity) async {

  }
}
