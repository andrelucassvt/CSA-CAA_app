import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/perfil/data/datasource/perfil_datasource_impl.dart';
import 'package:projeto_csa_app/app/modules/perfil/data/repository/perfil_repository_impl.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/datasource/perfil_datasource.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/repository/perfil_repository.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/usecases/get_perfil_medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/usecases/get_perfil_paciente.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/blocs/perfil/perfil_cubit.dart';

class PerfilDependecies {
  
  static void init(GetIt getIt){

    //Datasource
    getIt.registerFactory<PerfilDatasource>(() => PerfilDatasourceImpl(getIt()));

    //Repository
    getIt.registerFactory<PerfilRepository>(() => PerfilRepositoryImpl(getIt()));

    //usecases
    getIt.registerFactory<GetPerfilMedicoUsecase>(
      () => GetPerfilMedicoUsecase(perfilRepository: getIt()));
    getIt.registerFactory<GetPerfilPacienteUsecase>(
      () => GetPerfilPacienteUsecase(perfilRepository: getIt()));

    //Controllers
    getIt.registerFactory<PerfilCubit>(() => PerfilCubit(getIt(), getIt()));
  }
}