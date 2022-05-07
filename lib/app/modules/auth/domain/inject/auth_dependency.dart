import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/data/datasource/login_datasource_firebase.dart';
import 'package:projeto_csa_app/app/modules/auth/data/repository/login_repository_impl.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/datasource/login_datasource.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/repository/login_repository.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/usecases/login_medico_usecase.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/usecases/login_paciente_usecase.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/blocs/login/login_cubit.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/blocs/validar_acesso/validar_acesso_cubit.dart';

class AuthDependencies {

  static void init(GetIt getIt){

    //Datasource
    getIt.registerFactory<LoginDatasource>(
      () => LoginDataSourceFirebase(getIt()));

    //Repository
    getIt.registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(getIt()));

    //Usecase
    getIt.registerFactory<LoginMedicoUsecase>(
      () => LoginMedicoUsecase(getIt()));
    getIt.registerFactory<LoginPacienteUsecase>(
      () => LoginPacienteUsecase(getIt()));

    //Controllers
    getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt(), getIt()));

    getIt.registerFactory<ValidarAcessoCubit>(
      () => ValidarAcessoCubit(getIt()));
  }
}