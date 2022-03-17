import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys.dart';

part 'validar_acesso_state.dart';

class ValidarAcessoCubit extends Cubit<ValidarAcessoState> {
  final ManagerKeys managerKeys;
  ValidarAcessoCubit(this.managerKeys) : super(ValidarAcessoInitial());

  Future<void> validarAcesso() async {
    String token = await managerKeys.getToken();
    if (token.isEmpty || token == null) {
      emit(ValidarAcessoTelaDeLogin());
    } else {
      emit(ValidarAcessoHome());
    }
  }
}
