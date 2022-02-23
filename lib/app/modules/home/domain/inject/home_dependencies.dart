import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/home_repository.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_interacoes_do_paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_pacientes.dart';
import 'package:projeto_csa_app/app/modules/home/external/datasource/home_datasource_impl.dart';
import 'package:projeto_csa_app/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/interacoes_medico_paciente/interacoes_medico_pacientes_cubit.dart';

class HomeDependencies {
  
  static void init(){
    final getIt = GetIt.instance;

    //Datasource
    getIt.registerSingleton<HomeDatasource>(HomeDatasourceImpl());

    //Repository
    getIt.registerSingleton<HomeRepository>(
      HomeRepositoryImpl(getIt())
    );

    //Usecase
    getIt.registerSingleton<GetPacientesUseCase>(
      GetPacientesUseCase(getIt())
    );

    //Controllers
    getIt.registerLazySingleton<InteracoesMedicoPacientesCubit>(
      () => InteracoesMedicoPacientesCubit(getIt())
    );
    
  }
}