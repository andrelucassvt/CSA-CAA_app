import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys.dart';
import 'package:projeto_csa_app/app/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/datasource/auth_web_datasource.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/error/senha_errada_error.dart';

class AuthWebDatasourceImpl extends AuthWebDatasource {
  final ManagerKeys managerKeys;
  AuthWebDatasourceImpl({
    required this.managerKeys,
  });
  @override
  Future<void> login({required String email, required String senha}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:'andre@email.com',
        password: senha,
      );
      managerKeys.saveInfoUser(userCredential.user!.email.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CommonNoDataFoundError(message: 'Usuário não encontrado');
      } 
      if (e.code == 'wrong-password') {
        throw PasswordNoFoundError(message: 'Senha incorreta');
      }
      throw CommonDesconhecidoError(message: e.message);
    }
  }
  
}
