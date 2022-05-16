import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';

import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/usecase/get_perfil_mobile_usecase.dart';

part 'perfil_mobile_state.dart';

class PerfilMobileCubit extends Cubit<PerfilMobileState> {
  final GetPerfilMobileUseCase getPerfilMobileUseCase;
  PerfilMobileCubit(
    {required this.getPerfilMobileUseCase}
  ) : super(PerfilMobileInitial());


  Future<void> getPerfil() async {
    emit(PerfilMobileLoading());
    final result = await getPerfilMobileUseCase();
    emit(result.fold(
      (failure) => PerfilMobileFailure(failure: failure), 
      (sucess) => PerfilMobileSucess(pacienteEntity: sucess)));
  }
}
