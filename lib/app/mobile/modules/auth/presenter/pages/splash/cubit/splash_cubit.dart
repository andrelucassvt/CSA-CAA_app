import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final ManagerKeys managerKeys;
  SplashCubit({
    required this.managerKeys,
  }) : super(SplashInitial());

  Future<void> validarAcesso() async {
    String infoUser = await managerKeys.getInfoUser();
    if (infoUser.isEmpty) {
      emit(SplashTelaDeLogin());
    } else {
      emit(SplashTelaDeHome());
    }
  }

}
