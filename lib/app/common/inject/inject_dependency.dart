import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/inject/auth_mobile_inject.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/domain/inject/home_mobile_inject.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/inject/perfil_mobile_inject.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys_impl.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/inject/auth_web_inject.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/inject/home_web_inject.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/inject/perfil_web_inject.dart';

class InjectDependency {
  
  static void init(){
    final getIt = GetIt.instance;
    
    //Dependecies
    getIt.registerSingleton<FlutterTts>(FlutterTts());
    getIt.registerSingleton<ManagerKeys>(ManagerKeysImpl());

    //Mobile dependencies
    AuthMobileInject.init(getIt);
    HomeMobileInject.init(getIt);
    PerfilMobileInject.init(getIt);

    //Web dependencies
    AuthWebInject.init(getIt);
    HomeWebInject.init(getIt);
    PerfilWebInject.init(getIt);

  }

}