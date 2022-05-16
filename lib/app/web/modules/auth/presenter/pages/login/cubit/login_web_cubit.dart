import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/usecase/login_web_usecase.dart';

part 'login_web_state.dart';

class LoginWebCubit extends Cubit<LoginWebState> {
  final LoginWebUseCase loginWebUseCase;
  LoginWebCubit(
    this.loginWebUseCase,
  ) : super(LoginWebInitial());

  Future<void> login({required String email, required String senha}) async {
    emit(LoginWebLoading());
    if(email.isEmpty || senha.isEmpty) return emit(LoginWebDataisEmpty());
    if(EmailValidator.validate(email) == false) return emit(LoginWebEmailInvalid());
    var result = await loginWebUseCase(email: email,senha: senha);
    emit(result.fold(
      (failure) => LoginWebFailure(error: failure),
      (sucess) => LoginWebSucess()));
  }
}
