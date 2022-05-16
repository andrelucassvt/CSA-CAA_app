import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/data/datasource/perfil_mobile_datasource_impl.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/data/repository/perfil_mobile_repository_impl.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/datasource/perfil_mobile_datasource.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/repository/perfil_mobile_repository.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/usecase/get_perfil_mobile_usecase.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/presenter/pages/cubit/perfil_mobile_cubit.dart';

class PerfilMobileInject {
  
  static void init(GetIt getIt){
    //datasource
    getIt.registerFactory<PerfilMobileDatasource>(
      () => PerfilMobileDatasourceImpl(managerKeys: getIt()));

    //repository
    getIt.registerLazySingleton<PerfilMobileRepository>(
      () => PerfilMobileRepositoryImpl(datasource: getIt()));

    //usecase
    getIt.registerLazySingleton<GetPerfilMobileUseCase>(
      () => GetPerfilMobileUseCase(perfilRepository: getIt()));

    //controllers
    getIt.registerLazySingleton<PerfilMobileCubit>(
      () => PerfilMobileCubit(getPerfilMobileUseCase: getIt()));
  }
}