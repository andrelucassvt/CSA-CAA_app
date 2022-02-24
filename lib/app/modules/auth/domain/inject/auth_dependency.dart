import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/repository/login_repository.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/usecases/login_medico_usecase.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/usecases/login_paciente_usecase.dart';
import 'package:projeto_csa_app/app/modules/auth/external/datasource/login_datasource_impl.dart';
import 'package:projeto_csa_app/app/modules/auth/infra/datasource/login_datasource.dart';
import 'package:projeto_csa_app/app/modules/auth/infra/repository/login_repository_impl.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/cubit/login_cubit.dart';

class AuthDependencies {

  static void init(){
    final getIt = GetIt.instance;

    //Datasource
    getIt.registerFactory<LoginDatasource>(
      () => LoginDatasourceImpl());

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
  }
}