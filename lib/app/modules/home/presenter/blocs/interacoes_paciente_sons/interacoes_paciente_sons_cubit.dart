import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'interacoes_paciente_sons_state.dart';

class InteracoesPacienteSonsCubit extends Cubit<InteracoesPacienteSonsState> {
  InteracoesPacienteSonsCubit() : super(InteracoesPacienteSonsInitial());
}
