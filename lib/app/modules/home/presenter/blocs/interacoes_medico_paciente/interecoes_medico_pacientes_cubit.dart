import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'interecoes_medico_pacientes_state.dart';

class InterecoesMedicoPacientesCubit extends Cubit<InterecoesMedicoPacientesState> {
  InterecoesMedicoPacientesCubit() : super(InterecoesMedicoPacientesInitial());
}
