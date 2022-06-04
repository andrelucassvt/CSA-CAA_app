import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/web/modules/home/data/datasource/home_web_datasource_impl.dart';
import 'package:projeto_csa_app/app/web/modules/home/data/repository/home_web_repository_impl.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/datasource/home_web_datasource.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/repository/home_web_repository.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/atualizar_interacoes_paciente_usecase.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/cadastro_do_paciente_usecase.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/get_all_interacoes_usecase.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/get_interacoes_do_paciente_usecase.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/get_pacientes_usecase.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/cadastrar_paciente/cubit/cadastrar_paciente_cubit.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/detalhes_paciente/cubit/detalhes_paciente_cubit.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/escolher_interacoes/cubit/escolher_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/home/cubit/home_web_cubit.dart';

class HomeWebInject {

  static void init(GetIt getIt){
    
    //datasource
    getIt.registerFactory<HomeWebDatasource>(
            () => HomeWebDatasourceImpl(getIt()));
    
    //repository
    getIt.registerFactory<HomeWebRepository>(
            () => HomeWebRepositoryImpl(getIt()));

    
    //usecases
    getIt.registerFactory<GetPacientesUsecase>(
            () => GetPacientesUsecase(getIt()));
    getIt.registerFactory<GetInteracoesDoPacienteUsecase>(
            () => GetInteracoesDoPacienteUsecase(getIt()));
    getIt.registerFactory<GetAllInteracoesUsecase>(
            () => GetAllInteracoesUsecase(getIt()));
    getIt.registerFactory<CadastroDoPacienteUsecase>(
            () => CadastroDoPacienteUsecase(getIt()));
    getIt.registerFactory<AtualizarInteracoesPacienteUsecase>(
            () => AtualizarInteracoesPacienteUsecase(getIt()));
    
    //controllers
    getIt.registerFactory<HomeWebCubit>(
            () => HomeWebCubit(getPacientesUsecase: getIt()));
    getIt.registerFactory<DetalhesPacienteCubit>(
        () => DetalhesPacienteCubit(getInteracoesDoPacienteUsecase: getIt()));
    getIt.registerFactory<EscolherInteracoesCubit>(
        () => EscolherInteracoesCubit(getAllInteracoesUsecase: getIt()));
    getIt.registerFactory<CadastrarPacienteCubit>(
            () => CadastrarPacienteCubit(
              cadastroDoPacienteUsecase: getIt(),
              atualizarInteracoesPacienteUsecase: getIt(),
            ));

  }
}