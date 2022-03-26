import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/data/datasource/cadastro_paciente_datasource_impl.dart';
import 'package:projeto_csa_app/app/modules/home/data/datasource/home_datasource_impl.dart';
import 'package:projeto_csa_app/app/modules/home/data/repository/cadastro_paciente_repository_impl.dart';
import 'package:projeto_csa_app/app/modules/home/data/repository/home_repository_impl.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/cadastro_paciente_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/cadastro_paciente_repository.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/home_repository.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_all_interacoes_usecase.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_interacoes_do_paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_pacientes.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/post_cadastro_paciente_usecase.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/cadastro_paciente/cadastro_paciente_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/home_interacoes/home_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/player_audio/player_audio_cubit.dart';
import 'package:projeto_csa_app/app/shared/util/player_audio_local_impl.dart';

class HomeDependencies {
  
  static void init(GetIt getIt){
    
    //Datasource
    getIt.registerFactory<HomeDatasource>(() => HomeDatasourceImpl(getIt()));
    getIt.registerFactory<CadastroPacienteDatasource>(() => CadastroPacienteDatasourceImpl(getIt()));

    //Repository
    getIt.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(getIt())
    );
    getIt.registerFactory<CadastroPacienteRepository>(
      () => CadastroPacienteRepositoryImpl(getIt())
    );

    //Usecase
    getIt.registerFactory<GetPacientesUseCase>(
      () => GetPacientesUseCase(getIt())
    );
    getIt.registerFactory<GetInteracoesDoPacienteUsecase>(
      () => GetInteracoesDoPacienteUsecase(getIt())
    );
    getIt.registerFactory<GetAllInteracoesUsecase>(
      () => GetAllInteracoesUsecase(getIt())
    );
    getIt.registerFactory<PostCadastroPacienteUsecase>(
      () => PostCadastroPacienteUsecase(getIt())
    );

    //Controllers
    getIt.registerFactory<HomeInteracoesCubit>(
      () => HomeInteracoesCubit(getIt(),getIt())
    );
    getIt.registerFactory<CadastroPacienteCubit>(
      () => CadastroPacienteCubit(getIt(),getIt())
    );
    getIt.registerFactory<PlayerAudioCubit>(
      () => PlayerAudioCubit(PlayerAudioLocalImpl())
    );
  }
}