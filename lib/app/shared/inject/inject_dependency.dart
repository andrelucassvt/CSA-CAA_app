import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/inject/auth_dependency.dart';
import 'package:projeto_csa_app/app/modules/home/domain/inject/home_dependencies.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/inject/perfil_dependencies.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys_impl.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';

class InjectDependency {
  
  static void init(){
    final getIt = GetIt.instance;
    
    //Dependecies
    getIt.registerFactory<ManagerKeys>(() => ManagerKeysImpl());
    getIt.registerFactory<DioBuilder>(() => DioBuilder(getIt()));

    AuthDependencies.init(getIt);
    HomeDependencies.init(getIt);
    PerfilDependecies.init(getIt);
  }

}