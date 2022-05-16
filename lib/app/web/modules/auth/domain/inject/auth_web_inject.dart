import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/web/modules/auth/data/datasource/auth_web_datasource_impl.dart';
import 'package:projeto_csa_app/app/web/modules/auth/data/repository/auth_web_repository_impl.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/datasource/auth_web_datasource.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/repository/auth_web_repository.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/usecase/login_web_usecase.dart';
import 'package:projeto_csa_app/app/web/modules/auth/presenter/pages/login/cubit/login_web_cubit.dart';

class AuthWebInject {
  
  static void init(GetIt getIt) {

    //datasource
    getIt.registerFactory<AuthWebDatasource>(
      () => AuthWebDatasourceImpl(managerKeys: getIt()),
    );

    //repository
    getIt.registerFactory<AuthWebRepository>(
      () => AuthWebRepositoryImpl(datasource: getIt()));

    //usecase
    getIt.registerFactory<LoginWebUseCase>(
      () => LoginWebUseCase(authWebRepository: getIt()));

    //controller
    getIt.registerFactory<LoginWebCubit>(
      () => LoginWebCubit(getIt()));

  }
}