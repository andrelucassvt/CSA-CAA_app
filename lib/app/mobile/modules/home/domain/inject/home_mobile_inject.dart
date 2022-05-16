import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/data/datasource/home_mobile_datasource_impl.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/data/repository/home_mobile_repository_impl.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/domain/datasource/home_mobile_datasource.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/domain/repository/home_mobile_repository.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/domain/usecase/get_mobile_interacoes_usecase.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/presenter/pages/home/cubit/home_mobile_cubit.dart';

class HomeMobileInject {
  

  static void init(GetIt getIt) {
    //datasource
    getIt.registerFactory<HomeMobileDataSource>(
      () => HomeMobileDataSourceImpl(managerKeys: getIt()));

    //repository
    getIt.registerFactory<HomeMobileRepository>(
      () => HomeMobileRepositoryImpl(dataSource: getIt())); 

    //usecase
    getIt.registerFactory<GetMobileInteracoesUseCase>(
      () => GetMobileInteracoesUseCase(repository: getIt())
    );

    //controllers
    getIt.registerFactory<HomeMobileCubit>(
      () => HomeMobileCubit(getMobileInteracoesUseCase: getIt()));
  }

}