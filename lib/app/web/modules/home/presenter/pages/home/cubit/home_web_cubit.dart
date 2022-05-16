import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/get_pacientes_usecase.dart';

part 'home_web_state.dart';

class HomeWebCubit extends Cubit<HomeWebState> {

  HomeWebCubit({
    required this.getPacientesUsecase,
  }) : super(HomeWebInitial());

  final GetPacientesUsecase getPacientesUsecase;

  Future<void> getPacientes() async {
    emit(HomeWebLoading());
    final result = await getPacientesUsecase();
    emit(result.fold(
          (failure) => HomeWebFailure(failure),
          (sucess) => HomeWebSucess(sucess),
    ));
  }
}
