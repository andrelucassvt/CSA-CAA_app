import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/entities/medico.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/usecase/get_perfil_web_usecase.dart';

part 'perfil_web_state.dart';

class PerfilWebCubit extends Cubit<PerfilWebState> {

  final GetPerfilWebUsecase getPerfilWebUsecase;
  PerfilWebCubit({
    required this.getPerfilWebUsecase
  }) : super(PerfilWebInitial());

  Future<void> getPerfil() async {
    emit(PerfilWebLoading());
    final result = await getPerfilWebUsecase();
    emit(result.fold(
      (failure) => PerfilWebFailure(failure),
      (medico) => PerfilWebLoaded(medico),
    ));

  }
}
