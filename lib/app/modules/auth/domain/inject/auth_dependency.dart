import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/data/datasource/login_datasource_impl.dart';
import 'package:projeto_csa_app/app/modules/auth/data/repository/login_repository_impl.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/datasource/login_datasource.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/repository/login_repository.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/usecases/login_medico_usecase.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/usecases/login_paciente_usecase.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/cubit/login_cubit.dart';
import 'package:projeto_csa_app/app/shared/database/save_keys_impl.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';

class AuthDependencies {

  static void init(){
    final getIt = GetIt.instance;
    
    getIt.registerFactory<DioBuilder>(() => DioBuilder(SaveKeysImpl()));

    //Datasource
    getIt.registerFactory<LoginDatasource>(
      () => LoginDatasourceImpl(getIt()));

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