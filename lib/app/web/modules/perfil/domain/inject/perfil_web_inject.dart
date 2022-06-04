import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/data/datasource/perfil_web_datasource_impl.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/data/repository/perfil_web_repository_impl.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/datasource/perfil_web_datasource.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/repository/perfil_web_repository.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/usecase/get_perfil_web_usecase.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/presenter/pages/perfil/cubit/perfil_web_cubit.dart';

class PerfilWebInject {

  static void init(GetIt getIt) {

    //datasource
    getIt.registerFactory<PerfilWebDatasource>(
            () => PerfilWebDatasourceImpl(getIt()));

    //repository
    getIt.registerFactory<PerfilWebRepository>(
            () => PerfilWebRepositoryImpl(getIt()));

    //usecase
    getIt.registerFactory<GetPerfilWebUsecase>(
            () => GetPerfilWebUsecase(perfilWebRepository: getIt()));

    //cubit
    getIt.registerFactory<PerfilWebCubit>(
            () => PerfilWebCubit(getPerfilWebUsecase: getIt()));

  }

}