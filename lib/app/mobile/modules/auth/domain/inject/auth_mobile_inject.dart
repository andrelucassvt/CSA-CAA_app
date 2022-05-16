import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/data/datasource/auth_mobile_datasource_impl.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/data/repository/auth_mobile_repository_impl.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/datasource/auth_mobile_datasource.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/repository/auth_mobile_repository.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/usecase/login_mobile_usecase.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/presenter/pages/login/cubit/login_mobile_cubit.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/presenter/pages/splash/cubit/splash_cubit.dart';

class AuthMobileInject {
  
  static void init(GetIt getIt){

    //Datasource
    getIt.registerFactory<AuthMobileDataSource>(
      () => AuthMobileDataSourceImpl(
        managerKeys: getIt()
      ));

    //Repository
    getIt.registerFactory<AuthMobileRepository>(
      () => AuthMobileRepositoryImpl(dataSource: getIt()));

    //Usecase
    getIt.registerFactory<LoginMobileUseCase>(
      () => LoginMobileUseCase(repository: getIt()));

    //Controllers
    getIt.registerFactory<LoginMobileCubit>(
      () => LoginMobileCubit(loginMobileUseCase: getIt()));

    getIt.registerFactory<SplashCubit>(
      () => SplashCubit(managerKeys: getIt()));
  }
}