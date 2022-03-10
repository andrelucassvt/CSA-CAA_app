import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/data/datasource/home_datasource_impl.dart';
import 'package:projeto_csa_app/app/modules/home/data/repository/home_repository_impl.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/home_repository.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_interacoes_do_paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_pacientes.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/home_interacoes/home_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/player_audio/player_audio_cubit.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys_impl.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';
import 'package:projeto_csa_app/app/shared/util/player_audio_local_impl.dart';

class HomeDependencies {
  
  static void init(GetIt getIt){
    
    //Datasource
    getIt.registerSingleton<HomeDatasource>(HomeDatasourceImpl(getIt(),getIt()));

    //Repository
    getIt.registerSingleton<HomeRepository>(
      HomeRepositoryImpl(getIt())
    );

    //Usecase
    getIt.registerSingleton<GetPacientesUseCase>(
      GetPacientesUseCase(getIt())
    );
    getIt.registerSingleton<GetInteracoesDoPacienteUsecase>(
      GetInteracoesDoPacienteUsecase(getIt())
    );

    //Controllers
    getIt.registerLazySingleton<HomeInteracoesCubit>(
      () => HomeInteracoesCubit(getIt(),getIt())
    );
    getIt.registerFactory<PlayerAudioCubit>(
      () => PlayerAudioCubit(PlayerAudioLocalImpl())
    );
  }
}