import 'package:projeto_csa_app/app/modules/auth/domain/inject/auth_dependency.dart';
import 'package:projeto_csa_app/app/modules/home/domain/inject/home_dependencies.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/inject/perfil_dependencies.dart';

class InjectDependency {
  
  static void init(){
    HomeDependencies.init();
    AuthDependencies.init();
    PerfilDependecies.init();
  }

}