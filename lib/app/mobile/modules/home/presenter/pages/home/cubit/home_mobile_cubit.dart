import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/domain/usecase/get_mobile_interacoes_usecase.dart';

part 'home_mobile_state.dart';

class HomeMobileCubit extends Cubit<HomeMobileState> {

  final GetMobileInteracoesUseCase getMobileInteracoesUseCase;
  HomeMobileCubit({
    required this.getMobileInteracoesUseCase,
  }) : super(HomeMobileInitial());

  Future<void> getInteracoes() async {
    emit(HomeMobileLoading());
    var result = await getMobileInteracoesUseCase();
    emit(result.fold(
      (failure) => HomeMobileFailure(failure),
      (sucess) => HomeMobileSucess(sucess),
    ));
  }
}
